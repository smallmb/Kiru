import '../../../widgets/ui/kiru_toast.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../services/theme/fonts/font_registry.dart';
import '../../../services/theme/design_tokens.dart';
import '../../../widgets/settings/settings_scaffold.dart';
import '../../../widgets/ui/kiru_controls.dart';

class FontSettingsPage extends StatefulWidget {
  const FontSettingsPage({super.key});
  @override
  State<FontSettingsPage> createState() => _FontSettingsPageState();
}

class _FontSettingsPageState extends State<FontSettingsPage> {
  bool _busy = false;
  String _tr(String zh, String en) =>
      Localizations.localeOf(context).languageCode == 'zh' ? zh : en;

  String _role(FontRole role) => switch (role) {
    FontRole.chinese => _tr('中文字体', 'Chinese'),
    FontRole.latin => _tr('英文字体', 'Latin'),
    FontRole.number => _tr('数字字体', 'Numbers'),
    FontRole.timer => _tr('播放计时字体', 'Playback time'),
  };

  Future<void> _run(Future<void> Function() action) async {
    if (_busy) return;
    setState(() => _busy = true);
    try {
      await action();
    } catch (e) {
      if (mounted) {
        KiruToastMessenger.of(context).showSnackBar(
          KiruToast(
            content: Text(
              '${_tr('字体操作失败，请检查格式、字符覆盖及授权。', 'Font operation failed. Check format, glyph coverage and license.')}\n$e',
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _import(FontRole role) => _run(() async {
    final allowed = await showDialog<bool>(
      context: context,
      builder: (context) => KiruAlertDialog(
        title: Text(_tr('本地字体授权', 'Local font license')),
        content: Text(
          _tr(
            '仅导入拥有使用权的 TTF / OTF 字体。文件保存在本机，不上传。英文、数字和计时角色会在内存中限制字符映射以避免互相覆盖，请确认授权允许这种处理。MiSans 请仅作为中文字体导入。',
            'Import TTF/OTF fonts you have permission to use. Files remain on this device. Latin, numeric and timing roles restrict the glyph map in memory; ensure the license permits this. Import MiSans only for Chinese.',
          ),
        ),
        actions: [
          KiruButton(
            kind: KiruButtonKind.ghost,
            onPressed: () => Navigator.pop(context, false),
            child: Text(_tr('取消', 'Cancel')),
          ),
          KiruButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(_tr('确认授权并导入', 'I have permission')),
          ),
        ],
      ),
    );
    if (allowed != true) return;
    final picked = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['ttf', 'otf'],
    );
    final path = picked?.files.single.path;
    if (path != null) await FontRegistry.import(path, role);
  });

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return SettingsScaffold(
      title: _tr('字体与排版', 'Typography'),
      child: ValueListenableBuilder<int>(
        valueListenable: FontRegistry.revision,
        builder: (context, _, child) => ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              _tr(
                '独立管理中文、英文、数字和播放时间。切换即时生效，重启后保留。',
                'Choose Chinese, Latin, numeric and playback-time fonts independently. Changes persist.',
              ),
              style: ZplayType.body.toStyle(color: t.textSecondary),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: t.surface,
                borderRadius: BorderRadius.circular(18),
                border: Border.all(color: t.borderSubtle),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    _tr('实时预览', 'Live preview'),
                    style: ZplayType.caption.toStyle(color: t.textMuted),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '葬送的芙莉莲',
                    style: ZplayType.display
                        .copyWith(size: 32)
                        .toStyle(color: t.textPrimary),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "Frieren: Beyond Journey's End",
                    style: ZplayType.title.toStyle(color: t.textSecondary),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    '9.8   2023 · 28 集 · 4K HDR',
                    style: ZplayType.titleLarge.toStyle(color: t.accent),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    '00:18:42 / 00:24:00',
                    style: ZplayType.labelNumeric
                        .copyWith(size: 16)
                        .toTimingStyle(color: t.textPrimary),
                  ),
                  const SizedBox(height: 12),
                  Text(
                    'ABCDEFGHIJKLMNOPQRSTUVWXYZ  abcdefghijklmnopqrstuvwxyz\n0123456789  中文字体预览',
                    style: ZplayType.body.toStyle(color: t.textSecondary),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            for (final role in FontRole.values) ...[
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _role(role),
                      style: ZplayType.title.toStyle(color: t.textPrimary),
                    ),
                  ),
                  KiruButton(
                    kind: KiruButtonKind.ghost,
                    compact: true,
                    onPressed: _busy ? null : () => _import(role),
                    icon: const Icon(Icons.add_rounded),
                    child: Text(_tr('导入字体', 'Import')),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              KiruSelect<String>(
                key: ValueKey(
                  'font-${role.name}-${FontRegistry.selected(role)}',
                ),
                value: FontRegistry.selected(role),
                items: {
                  for (final font in FontRegistry.fonts)
                    if (font.availableFor(role))
                      font.name +
                              (FontRegistry.fonts
                                          .where((f) => f.name == font.name)
                                          .length >
                                      1
                                  ? ' (${font.id})'
                                  : ''):
                          font.id,
                },
                onChanged: _busy
                    ? null
                    : (id) {
                        if (id != null) {
                          _run(() => FontRegistry.select(role, id));
                        }
                      },
              ),
              const SizedBox(height: 18),
            ],
            KiruButton(
              kind: KiruButtonKind.ghost,
              compact: true,
              onPressed: () => launchUrl(
                Uri.parse('https://hyperos.mi.com/font/zh/'),
                mode: LaunchMode.externalApplication,
              ),
              icon: const Icon(Icons.open_in_new_rounded, size: 16),
              child: Text(_tr('获取 MiSans（官方）', 'Get MiSans (official)')),
            ),
            Text(
              _tr(
                'MiSans 不随开源安装包再分发；下载后可在中文角色中导入。内置中文使用 Noto Sans SC。',
                'MiSans is not redistributed with the open-source package. Download and import for Chinese; Noto Sans SC is bundled.',
              ),
              style: ZplayType.bodySmall.toStyle(color: t.textMuted),
            ),
            const SizedBox(height: 18),
            Text(
              _tr('本地字体库', 'Local font library'),
              style: ZplayType.title.toStyle(color: t.textPrimary),
            ),
            if (!FontRegistry.fonts.any((f) => f.imported))
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Text(
                  _tr('尚未导入字体', 'No imported fonts'),
                  style: ZplayType.body.toStyle(color: t.textMuted),
                ),
              ),
            for (final f in FontRegistry.fonts.where((f) => f.imported))
              KiruListTile(
                title: Text(f.name),
                trailing: KiruIconButton(
                  tooltip: _tr('删除', 'Remove'),
                  onPressed: _busy
                      ? null
                      : () => _run(() => FontRegistry.remove(f.id)),
                  icon: const Icon(Icons.delete_outline_rounded),
                ),
              ),
            const SizedBox(height: 16),
            KiruButton(
              kind: KiruButtonKind.outline,
              expand: true,
              onPressed: _busy ? null : () => _run(FontRegistry.reset),
              icon: const Icon(Icons.refresh_rounded),
              child: Text(_tr('恢复默认字体组合', 'Restore defaults')),
            ),
            if (_busy)
              const Padding(
                padding: EdgeInsets.only(top: 12),
                child: KiruProgress(),
              ),
          ],
        ),
      ),
    );
  }
}
