import 'package:flutter/material.dart';
import 'package:zplay/l10n/l10n.dart';
import '../../../services/theme/design_tokens.dart';
import '../../../services/theme/glass_settings.dart';
import '../../../widgets/common/performance_liquid_lens.dart';
import '../../../widgets/settings/settings_scaffold.dart';
import '../../../widgets/ui/kiru_controls.dart';

class LiquidGlassSettingsPage extends StatelessWidget {
  const LiquidGlassSettingsPage({super.key});
  @override
  Widget build(BuildContext context) => SettingsScaffold(
    title: l10nOf(context).auxLiquidGlassSettingsPageFrostedGlassBlur,
    actions: [
      KiruButton(
        kind: KiruButtonKind.ghost,
        onPressed: () => GlassSettings.resetToDefaults(),
        child: Text(l10nOf(context).uiAnimeSearchPageReset),
      ),
    ],
    child: ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ValueListenableBuilder<bool>(
          valueListenable: GlassSettings.enabled,
          builder: (context, enabled, _) => KiruSwitchRow(
            title: Text(
              l10nOf(context).auxLiquidGlassSettingsPageFrostedGlassBlur,
            ),
            value: enabled,
            onChanged: (v) => GlassSettings.setEnabled(v),
          ),
        ),
        const SizedBox(height: 20),
        Container(
          height: 180,
          decoration: BoxDecoration(
            borderRadius: ZplayRadius.lgAll,
            gradient: const LinearGradient(
              colors: [Color(0xFF385589), Color(0xFF794B85)],
            ),
          ),
          child: Center(
            child: FrostedSurface(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 28,
                  vertical: 20,
                ),
                child: Text(
                  l10nOf(context).auxLiquidGlassSettingsPageFrostedGlassBlur,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        ValueListenableBuilder<double>(
          valueListenable: GlassSettings.blurSigma,
          builder: (context, sigma, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10nOf(
                  context,
                ).auxLiquidGlassSettingsPageGaussianBlurDiffusionAppliedBehindGlassComponents,
              ),
              KiruSlider(
                value: sigma.clamp(0.0, 10.0),
                min: 0,
                max: 10,
                divisions: 20,
                label: sigma.toStringAsFixed(1),
                onChanged: (v) => GlassSettings.updateCustom(newBlurSigma: v),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
