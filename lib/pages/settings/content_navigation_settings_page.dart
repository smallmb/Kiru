import '../../widgets/ui/kiru_toast.dart';
import 'package:flutter/material.dart';
import '../../l10n/l10n.dart';
import '../../services/content/navigation_settings.dart';
import '../../services/theme/design_tokens.dart';
import '../../widgets/settings/settings_scaffold.dart';
import '../../widgets/ui/kiru_controls.dart';
import '../browse/browse_page.dart';

class ContentNavigationSettingsPage extends StatefulWidget {
  const ContentNavigationSettingsPage({super.key});

  @override
  State<ContentNavigationSettingsPage> createState() =>
      _ContentNavigationSettingsPageState();
}

class _ContentNavigationSettingsPageState
    extends State<ContentNavigationSettingsPage> {
  bool _saving = false;
  String tr(String zh, String en) =>
      Localizations.localeOf(context).languageCode == 'zh' ? zh : en;

  Future<void> _save(Future<void> Function() action) async {
    if (_saving) return;
    setState(() => _saving = true);
    try {
      await action();
    } catch (e) {
      if (mounted) {
        KiruToastMessenger.of(context).showSnackBar(
          KiruToast(
            content: Text(
              tr(
                '\u4fdd\u5b58\u5931\u8d25\uff0c\u8bf7\u91cd\u8bd5\u3002',
                'Could not save. Please try again.',
              ),
            ),
          ),
        );
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = l10nOf(context);
    final tokens = context.tokens;
    return SettingsScaffold(
      title: tr('\u5185\u5bb9\u4e0e\u5bfc\u822a', 'Content & navigation'),
      child: ValueListenableBuilder<Set<String>>(
        valueListenable: NavigationSettings.enabled,
        builder: (context, selected, _) => ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Text(
              tr(
                '\u9009\u62e9\u60f3\u8981\u663e\u793a\u7684\u5185\u5bb9\u6a21\u5757\uff0c\u4e0d\u5f71\u54cd\u6536\u85cf\u4e0e\u64ad\u653e\u8bb0\u5f55\u3002',
                'Choose the content modules shown in navigation. Favorites and playback history are unaffected.',
              ),
              style: ZplayType.body.toStyle(color: tokens.textSecondary),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: tokens.surface,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                children: [
                  KiruBadge(child: Text(l10n.navHome)),
                  for (final vertical in BrowseVertical.values)
                    if (selected.contains(vertical.name))
                      KiruBadge(child: Text(vertical.localizedLabel(context))),
                  KiruBadge(child: Text(l10n.navLibrary)),
                ],
              ),
            ),
            const SizedBox(height: 16),
            KiruListTile(
              leading: const Icon(Icons.home_rounded),
              title: Text(l10n.navHome),
              trailing: const Icon(Icons.lock_outline_rounded),
            ),
            for (final vertical in BrowseVertical.values)
              if (NavigationSettings.modules.contains(vertical.name))
                KiruSwitchRow(
                  key: ValueKey('content-module-${vertical.name}'),
                  icon: Icon(vertical.icon),
                  title: Text(vertical.localizedLabel(context)),
                  value: selected.contains(vertical.name),
                  onChanged:
                      _saving ||
                          (selected.length == 1 &&
                              selected.contains(vertical.name))
                      ? null
                      : (value) => _save(
                          () => NavigationSettings.setEnabled(
                            vertical.name,
                            value,
                          ),
                        ),
                ),
            KiruListTile(
              leading: const Icon(Icons.bookmark_rounded),
              title: Text(l10n.navLibrary),
              trailing: const Icon(Icons.lock_outline_rounded),
            ),
            const SizedBox(height: 12),
            Text(
              tr(
                '\u9996\u9875\u4e0e\u5a92\u4f53\u5e93\u56fa\u5b9a\u663e\u793a\uff0c\u81f3\u5c11\u4fdd\u7559\u4e00\u4e2a\u5185\u5bb9\u6a21\u5757\u3002',
                'Home and Library remain visible. Keep at least one content module.',
              ),
              style: ZplayType.caption.toStyle(color: tokens.textMuted),
            ),
            const SizedBox(height: 24),
            KiruButton(
              kind: KiruButtonKind.outline,
              expand: true,
              onPressed: _saving ? null : () => _save(NavigationSettings.reset),
              icon: const Icon(Icons.restart_alt_rounded),
              child: Text(
                tr(
                  '\u6062\u590d\u9ed8\u8ba4\u5bfc\u822a',
                  'Restore default navigation',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
