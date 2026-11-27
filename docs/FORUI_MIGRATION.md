# Kiru UI migration

Forui 0.28.0 is pinned for Flutter 3.50.1 / Dart 3.14.0.
Keep the existing MaterialApp/navigation and Design Tokens as the source of truth.
KiruForuiTheme bridges the palette and runtime font families. Feature code should use
KiruButton, KiruSwitchRow and KiruBadge from widgets/ui/kiru_controls.dart.
Phase 1: content navigation settings and typography action buttons.
Phase 2 (in progress): KiruSelect and KiruTextField, font/source/home selectors, anime network fields, and 22 appearance switches. Shared settings navigation rows, dialogs, popovers, and feedback remain to migrate.
Phase 3: shared media cards and detail pages; preserve accessibility and focus.
Phase 4: player overlays and custom glass chrome, only after behavior/visual checks.
Do not replace layout primitives, native windows, media renderers or bespoke
glass shaders simply because they are not Forui widgets.
The media-kit override refs are pinned to the existing lockfile revision so pub get
does not resolve a different upstream HEAD (which removed the OHOS package path).

## Shared controls migration status

Converted existing button, icon button, slider, indeterminate loader, linear progress, dialog, divider, switch, form input, checkbox row, and list tile call sites to Forui-backed Kiru controls. Legacy style metadata remains accepted by the adapters. Forui 0.28 uses material_ui 1.2.0 input borders; the compatibility adapter converts Flutter borders explicitly.

Remaining native component call sites (inventory, excludes wrappers):

- SnackBar: 105
- IconButton: 58
- Tooltip: 26
- TextField: 6
- ChoiceChip: 5
- TabBar: 4
- DropdownButton: 4
- Radio: 3
- PopupMenuButton: 3
- TextFormField: 3
- ListTile: 2
- DropdownButtonFormField: 2
- CircularProgressIndicator: 2
- VerticalDivider: 2
- Slider: 1
- TextButton: 1

The inventory is not a completion percentage: custom playback/desktop controls and specialized focus and overlay behavior need individual verification. Keep native window handling, rendering, and layout primitives intact.

## Player content migration

- player_forui.dart: PlayerTappable (FTappable.static), PlayerTrackFill (FDeterminateProgress with zero interpolation delay), PlayerRadio (FRadio), PlayerTooltip (FTooltip).
- Shared transport buttons, audio/subtitle/speed/aspect menu rows, episode/source cards, sync controls and loading actions now use the player interaction adapter. Retain the app focus ring, remote Enter/Select/Space/gamepad activation, and custom glass rendering.
- Subtitle appearance: FTabs, FSelect, FSlider, FRadio, FSwitch and Forui icon buttons. Remove inactive Material SliderTheme wrappers.
- Seek and volume keep custom gesture handling, buffering and skip markers, the 100% boost threshold, and dedicated keyboard mapping. Only the fill is Forui-backed.
- Player-related remaining native UI includes SnackBar notifications and specialized waveform seek controls; media rendering, gesture recognizers, navigation and glass surfaces are intentionally not replaced. Real-device playback and visual inspection remain separate acceptance steps.

## Final standard-component inventory (2026-11-27)

This supersedes the earlier remaining-call-site counts. The scanned standard
Material controls have zero direct constructor or showMenu call sites in lib
outside the shared compatibility adapters and generated files.

- Production notifications use FToaster/FToast with FIFO delivery, dismiss
  actions, duration and action callbacks; isolated Material hosts retain a
  ScaffoldMessenger fallback. Toast placement uses a common bottom-center style.
- Remaining icon buttons, tooltips, search and validated form inputs, choice
  chips, selects, popovers, anchored menus, tabs, tiles and accordions use
  Forui-backed shared controls. Vertical dividers use FDivider.
- The standard music slider uses FSlider and commits the latest interaction
  value; custom waveform/radial painters remain. Determinate circular progress
  uses a custom painter since Forui's circular progress is indeterminate.
- Retain MaterialApp, navigation and modal route shells, native window controls,
  layout primitives, media renderers, custom glass and artwork rendering.
  Legacy style and menu item data objects remain as compatibility inputs;
  they are not direct Material UI rendering in feature code.

Automated regression coverage includes the production toaster, slider release,
menu result, validation, search, shell and player interactions. Visual review
and real playback on each supported platform are separate acceptance steps.

## Player visual migration

PlayerIconButton now uses Forui FButton.raw with the ghost variant, a flat
transparent idle surface, rounded hover/press wash, and the existing remote
focus ring. Play/pause shares the same implementation. Removed LiquidGlassLens
and LiquidGlassView from player widgets, playback and watch-source pages,
independently of the global liquid-glass setting. Retained clipped Gaussian
backdrop blur on the bottom transport and popover cards. Timeline and gain
fills are solid colors without glow, gradients or thumb shadows; gestures,
buffer and skip markers and gain mapping are unchanged.

The global glass configuration and other application pages remain intact.
41 targeted widget regression tests passed, including the glass-enabled
Ghost button test, remote focus traversal, and seek/volume callbacks.
Real video playback and visual inspection remain separate acceptance steps.

## 1.6.27 visual and window chrome
All direct LiquidGlassView/LiquidGlassLens renderers have been removed, including
music overlays, audiobook buttons and appearance previews. FrostedSurface uses
a clipped Gaussian backdrop only; the previous optical preset identifiers are
retained for preference compatibility. The settings page exposes the effective
blur switch and strength, not obsolete refraction controls. Deliberate media
artwork, custom animation presets and focus rings remain custom surfaces.
The Windows app root reserves a 10dp caption strip above the Navigator on all
routes, with the existing wider caption targets in the main/player/settings
headers. Fullscreen removes the strip without remounting navigation.

## Final interaction and anime layout verification

The remaining 34 Material InkWell call sites now use the shared KiruTappable
adapter over Forui FTappable. The anime catalogue has a dedicated toolbar below
the shell inset, with mode tabs at the leading edge and its dedicated search
at the trailing edge. The redundant settings action is removed. A clipped
content viewport prevents artwork and scrolling content from covering controls.

Final Windows verification: 1504 tests passed, 0 failed, 16 skipped by test
configuration. The new anime toolbar layout is tested at 360, 800 and 1440
logical-pixel widths and in the real application shell. Dart analysis reported
no errors or warnings (133 informational lint findings). Windows debug build
completed successfully. Live third-party network tests and manual real-media
acceptance are not covered by this result.
