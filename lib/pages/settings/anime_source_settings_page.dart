import 'package:flutter/material.dart';
import '../../l10n/l10n.dart';
import '../../services/anime/anime_source_settings.dart';
import '../../services/anime/bangumi_client.dart';
import '../../widgets/settings/settings_scaffold.dart';

class AnimeSourceSettingsPage extends StatefulWidget {
  const AnimeSourceSettingsPage({super.key});
  @override
  State<AnimeSourceSettingsPage> createState() =>
      _AnimeSourceSettingsPageState();
}

class _AnimeSourceSettingsPageState extends State<AnimeSourceSettingsPage> {
  final _mirror = TextEditingController(text: AnimeSourceSettings.mirror.value);
  final _proxy = TextEditingController(text: AnimeSourceSettings.proxy.value);
  bool _busy = false;
  @override
  void dispose() {
    _mirror.dispose();
    _proxy.dispose();
    super.dispose();
  }

  void _message(String text) {
    if (mounted)
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
  }

  Future<void> _save() async {
    final l = l10nOf(context);
    try {
      await AnimeSourceSettings.setNetwork(_mirror.text, _proxy.text);
      _message(l.animeSourceSaved);
    } on FormatException {
      _message(l.animeSourceInvalid);
    }
  }

  Future<void> _test() async {
    final l = l10nOf(context);
    setState(() => _busy = true);
    final client = BangumiClient();
    try {
      final data = await client.request(
        Uri.https('api.bgm.tv', '/v0/subjects/400602'),
      );
      _message(
        data is Map && data['id'] == 400602
            ? l.animeSourceCheckOk
            : l.animeSourceCheckFail,
      );
    } catch (_) {
      _message(l.animeSourceCheckFail);
    } finally {
      client.close();
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l = l10nOf(context);
    return SettingsScaffold(
      title: l.animeSourceSettingsTitle,
      child: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Text(l.animeSourceSettingsSubtitle),
          const SizedBox(height: 12),
          ValueListenableBuilder<AnimeSource>(
            valueListenable: AnimeSourceSettings.source,
            builder: (context, source, _) =>
                DropdownButtonFormField<AnimeSource>(
                  initialValue: source,
                  decoration: InputDecoration(
                    labelText: l.animeSourceSettingsTitle,
                  ),
                  items: [
                    DropdownMenuItem(
                      value: AnimeSource.anilist,
                      child: Text(l.animeSourceAniList),
                    ),
                    DropdownMenuItem(
                      value: AnimeSource.bangumi,
                      child: Text(l.animeSourceBangumi),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) AnimeSourceSettings.setSource(value);
                  },
                ),
          ),
          const SizedBox(height: 12),
          Text(l.animeSourceIdentityHelp),
          ValueListenableBuilder<bool>(
            valueListenable: AnimeSourceSettings.fallback,
            builder: (context, value, _) => SwitchListTile(
              title: Text(l.animeSourceFallback),
              subtitle: Text(l.animeSourceFallbackHelp),
              value: value,
              onChanged: AnimeSourceSettings.setFallback,
            ),
          ),
          const SizedBox(height: 20),
          TextField(
            controller: _mirror,
            decoration: InputDecoration(labelText: l.animeSourceMirror),
            keyboardType: TextInputType.url,
          ),
          Text(l.animeSourceMirrorHelp),
          const SizedBox(height: 16),
          TextField(
            controller: _proxy,
            decoration: InputDecoration(labelText: l.animeSourceProxy),
            keyboardType: TextInputType.url,
          ),
          Text(l.animeSourceProxyHelp),
          const SizedBox(height: 16),
          FilledButton(onPressed: _save, child: Text(l.animeSourceSave)),
          OutlinedButton(
            onPressed: _busy ? null : _test,
            child: Text(l.animeSourceCheck),
          ),
        ],
      ),
    );
  }
}
