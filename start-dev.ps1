param([switch]$NoPub)

$ErrorActionPreference = 'Stop'
$root = [IO.Path]::GetFullPath($PSScriptRoot)
$debugDir = Join-Path $root 'build\windows\x64\runner\Debug'
$runnerPaths = @('zplay.exe', 'kiru.exe') | ForEach-Object {
    [IO.Path]::GetFullPath((Join-Path $debugDir $_))
}
$flutterRoot = if ($env:FLUTTER_ROOT) { $env:FLUTTER_ROOT } else { 'D:\Apps\flutter' }
$flutter = Join-Path $flutterRoot 'bin\flutter.bat'
if (-not (Test-Path -LiteralPath $flutter -PathType Leaf)) {
    Write-Error "Flutter SDK not found: $flutter"
    exit 1
}

# One launcher per checkout. Other projects and release builds are untouched.
$sha = [Security.Cryptography.SHA256]::Create()
try {
    $hash = [BitConverter]::ToString($sha.ComputeHash([Text.Encoding]::UTF8.GetBytes($root.TrimEnd('\').ToLowerInvariant()))).Replace('-', '')
} finally { $sha.Dispose() }
$mutex = New-Object System.Threading.Mutex($false, "Local\KiruDev_$hash")
$ownsMutex = $false
$exitCode = 1
function Get-ProjectRunners {
    Get-Process -Name zplay,kiru -ErrorAction SilentlyContinue | Where-Object {
        try { $_.Path -and ($runnerPaths -contains $_.Path) } catch { $false }
    }
}
function Wait-Unlocked([string]$path, [int]$seconds = 12) {
    $deadline = [DateTime]::UtcNow.AddSeconds($seconds)
    do {
        if (-not (Test-Path -LiteralPath $path -PathType Leaf)) { return }
        try {
            $handle = [IO.File]::Open($path, [IO.FileMode]::Open, [IO.FileAccess]::ReadWrite, [IO.FileShare]::None)
            $handle.Dispose()
            return
        } catch [IO.IOException] {
            Start-Sleep -Milliseconds 250
        } catch [UnauthorizedAccessException] {
            throw "Cannot write $path. Check file permissions or read-only attributes."
        }
    } while ([DateTime]::UtcNow -lt $deadline)
    throw "File still locked: $path. Close the application using it, then retry."
}
try {
    try { $ownsMutex = $mutex.WaitOne(0) }
    catch [System.Threading.AbandonedMutexException] { $ownsMutex = $true }
    if (-not $ownsMutex) {
        Write-Host '[Kiru] A development session from this launcher is already running.'
        Write-Host '[Kiru] Use r for hot reload in that terminal, or q to quit before restarting.'
        $exitCode = 0
    } else {
        Set-Location -LiteralPath $root
        $env:FLUTTER_ROOT = $flutterRoot
        $env:PATH = (Join-Path $flutterRoot 'bin') + ';' + $env:PATH
        foreach ($process in @(Get-ProjectRunners)) {
            Write-Host "[Kiru] Closing old debug runner (PID $($process.Id))..."
            try {
                if (-not $process.HasExited) {
                    if ($process.CloseMainWindow()) { [void]$process.WaitForExit(5000) }
                    if (-not $process.HasExited -and ($runnerPaths -contains $process.Path)) {
                        Write-Host "[Kiru] Old runner did not exit; stopping PID $($process.Id)."
                        $process.Kill()
                        [void]$process.WaitForExit(5000)
                    }
                }
            } catch {
                if (-not $process.HasExited) { throw }
            } finally { $process.Dispose() }
        }
        if (@(Get-ProjectRunners).Count -gt 0) {
            throw 'A project debug runner is still running. Close it before rebuilding.'
        }
        foreach ($path in @($runnerPaths) + @(Join-Path $debugDir 'WebView2Loader.dll')) {
            Wait-Unlocked $path
        }
        Write-Host '[Kiru] Debug output is unlocked. Starting Flutter...'
        $flutterArgs = @('run', '-d', 'windows', '--debug')
        if ($NoPub) { $flutterArgs += '--no-pub' }
        & $flutter @flutterArgs
        $exitCode = $LASTEXITCODE
    }
} catch {
    Write-Host "[Kiru] $($_.Exception.Message)" -ForegroundColor Red
    $exitCode = 1
} finally {
    if ($ownsMutex) { $mutex.ReleaseMutex() }
    $mutex.Dispose()
}
exit $exitCode
