import 'package:zplay/l10n/l10n.dart';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../services/theme/design_tokens.dart';
import '../../widgets/player/player_glass.dart';
import '../../widgets/common/zplay_logo.dart';
import '../../widgets/settings/settings_scaffold.dart';

class AboutSettingsPage extends StatelessWidget {
  const AboutSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    return SettingsScaffold(
      title: l10nOf(context).uiAboutSettingsPageAboutZplay,
      child: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: ZplaySpacing.s16,
          vertical: ZplaySpacing.s24,
        ),
        children: [
          // App Brand Header
          Center(
            child: Column(
              children: [
                const ZplayLogo(size: 72),
                const SizedBox(height: 16),
                Text(
                  'Kiru',
                  style: ZplayType.display.toStyle(color: tokens.textPrimary),
                ),
                const SizedBox(height: 6),
                FutureBuilder<PackageInfo>(
                  future: PackageInfo.fromPlatform(),
                  builder: (context, snapshot) {
                    final version = snapshot.hasData ? snapshot.data!.version : '1.1.6';
                    return Text(
                      l10nOf(context).dynamicAboutSettingsPageVersionNextGenStreamingHub((version).toString()),
                      style: ZplayType.label.toStyle(
                        color: tokens.textSecondary,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),

          const SizedBox(height: 32),

          // Description
          Padding(
            padding: const EdgeInsets.all(ZplaySpacing.s20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10nOf(context).uiAboutSettingsPageUniversalEntertainmentEcosystem,
                  style: ZplayType.subtitle.toStyle(
                    color: tokens.textPrimary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  l10nOf(context).auxAboutSettingsPageZplayIsAnAllInOneEntertainment,
                  style: ZplayType.body
                      .toStyle(color: tokens.textSecondary)
                      .copyWith(height: 1.45),
                ),
              ],
            ),
          ),

          const SizedBox(height: 24),

          // Architecture & Core Technologies
          Text(
            l10nOf(context).uiAboutSettingsPageCoreTechnologies,
            style: ZplayType.overline.toStyle(color: tokens.textMuted),
          ),
          const SizedBox(height: 12),

          _buildTechTile(
            context: context,
            title: l10nOf(context).uiAboutSettingsPageHighPerformanceVideoEngine,
            subtitle: l10nOf(context).uiAboutSettingsPagePoweredByEmbeddedMediaKitLibmpv,
          ),
          const SizedBox(height: 10),
          _buildTechTile(
            context: context,
            title: l10nOf(context).auxAboutSettingsPageDebridMultiSourceScrapers,
            subtitle: l10nOf(context).auxAboutSettingsPageDirectHighSpeedCloudPlaybackViaReal,
          ),
          const SizedBox(height: 10),
          _buildTechTile(
            context: context,
            title: l10nOf(context).auxAboutSettingsPageLiquidGlassGlslShaders,
            subtitle: l10nOf(context).auxAboutSettingsPageCustomRealTimeOpticalRefractionLensesAnd,
          ),
          const SizedBox(height: 10),
          _buildTechTile(
            context: context,
            title: l10nOf(context).auxAboutSettingsPageTraktCloudSynchronization,
            subtitle: l10nOf(context).auxAboutSettingsPageCrossPlatformWatchlistEpisodeTrackingAndPlayback,
          ),

          const SizedBox(height: 24),

          // Credits & Licence
          Text(
            l10nOf(context).uiAboutSettingsPageCreditsLicence,
            style: ZplayType.overline.toStyle(color: tokens.textMuted),
          ),
          const SizedBox(height: 12),

          _buildLinkTile(
            context: context,
            icon: Icons.code_rounded,
            title: 'ZPlay',
            subtitle: l10nOf(context).uiAboutSettingsPageIndependentForkMaintainedByTzero86,
            url: 'https://github.com/tzero86/ZPlay',
          ),
          const SizedBox(height: 10),
          _buildLinkTile(
            context: context,
            icon: Icons.history_edu_rounded,
            title: l10nOf(context).uiAboutSettingsPageBasedOnPlaytorrioV3,
            subtitle: l10nOf(context).uiAboutSettingsPageOriginalProjectByAymanAyman708Ux,
            url: 'https://github.com/ayman708-UX/PlayTorrioV3',
          ),
          const SizedBox(height: 10),
          _buildLinkTile(
            context: context,
            icon: Icons.info_outline,
            title: 'Bangumi Data',
            subtitle: l10nOf(context).animeTitleDataAttribution,
            url: 'https://github.com/bangumi-data/bangumi-data',
          ),
          const SizedBox(height: 10),
          _buildTmdbAttributionTile(context),
          const SizedBox(height: 10),
          _buildLicenseTile(context),

          const SizedBox(height: 16),
          Text(
            l10nOf(context).auxAboutSettingsPagePoppinsIsBundledUnderTheSilOpen,
            style: ZplayType.bodySmall.toStyle(color: tokens.textDisabled),
          ),
        ],
      ),
    );
  }

  Widget _buildTechTile({
    required BuildContext context,
    required String title,
    required String subtitle,
  }) {
    final tokens = context.tokens;
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(top: 2),
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              color: tokens.accent,
              borderRadius: ZplayRadius.xsAll,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: ZplayType.subtitle.toStyle(
                    color: tokens.textPrimary,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: ZplayType.bodySmall.toStyle(
                    color: tokens.textSecondary,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// A tappable credit row that opens [url] in the system browser.
  Widget _buildLinkTile({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required String url,
  }) {
    final tokens = context.tokens;
    return _CreditTile(
      icon: icon,
      title: title,
      subtitle: subtitle,
      trailing: Icon(
        Icons.open_in_new_rounded,
        size: 16,
        color: tokens.textMuted,
      ),
      onTap: () => _openUrl(url),
    );
  }

  /// TMDb attribution, required by the TMDb terms: their logo, the notice
  /// verbatim, and a link back to themoviedb.org.
  Widget _buildTmdbAttributionTile(BuildContext context) {
    final tokens = context.tokens;
    return Padding(
      padding: const EdgeInsets.all(14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/branding/tmdb-logo.png',
            height: 20,
            fit: BoxFit.contain,
            alignment: Alignment.centerLeft,
            errorBuilder: (context, error, stackTrace) => Text(
              'TMDB',
              style: ZplayType.label.toStyle(color: tokens.textPrimary),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            l10nOf(context).uiAboutSettingsPageThisProductUsesTheTmdbApi,
            style: ZplayType.bodySmall
                .toStyle(color: tokens.textSecondary)
                .copyWith(height: 1.35),
          ),
          const SizedBox(height: 6),
          FocusableInkWell(
            onTap: () => _openUrl('https://www.themoviedb.org'),
            borderRadius: ZplayRadius.xsAll,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: Text(
                'themoviedb.org',
                style: ZplayType.label.toStyle(
                  color: tokens.accent,
                  decoration: TextDecoration.underline,
                  decorationColor: tokens.accent,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Opens the licence notice: ZPlay's own GPL attribution header plus every
  /// third-party package licence Flutter collected at build time.
  Widget _buildLicenseTile(BuildContext context) {
    final tokens = context.tokens;
    return _CreditTile(
      icon: Icons.gavel_rounded,
      title: 'GNU GPL v3.0',
      subtitle:
          l10nOf(context).aboutUpstreamLicense,
      trailing: Icon(
        Icons.chevron_right_rounded,
        size: 20,
        color: tokens.textMuted,
      ),
      onTap: () => showLicensePage(
        context: context,
        applicationName: 'Kiru',
        applicationLegalese: 'Copyright (C) 2026 tzero86\n'
            'Based on PlayTorrio V3, Copyright (C) 2026 Ayman\n'
            'https://github.com/tzero86/ZPlay\n'
            'https://github.com/ayman708-UX/PlayTorrioV3\n\n'
            'This program is free software: you can redistribute it and/or modify '
            'it under the terms of the GNU General Public License as published by '
            'the Free Software Foundation, either version 3 of the License, or '
            '(at your option) any later version.\n\n'
            'This program is distributed in the hope that it will be useful, but '
            'WITHOUT ANY WARRANTY; without even the implied warranty of '
            'MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU '
            'General Public License for more details.',
      ),
    );
  }

  Future<void> _openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

/// Shared visual for the credits rows on the About page.
class _CreditTile extends StatelessWidget {
  const _CreditTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.trailing,
    required this.onTap,
  });

  final IconData icon;
  final String title;
  final String subtitle;
  final Widget trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final tokens = context.tokens;
    return FocusableInkWell(
      onTap: onTap,
      borderRadius: ZplayRadius.mdAll,
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 18, color: tokens.accent),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: ZplayType.subtitle.toStyle(
                      color: tokens.textPrimary,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: ZplayType.bodySmall
                        .toStyle(color: tokens.textSecondary)
                        .copyWith(height: 1.35),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(top: 2),
              child: trailing,
            ),
          ],
        ),
      ),
    );
  }
}
