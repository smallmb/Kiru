import '../../services/metadata/anime_chinese_titles.dart';
import 'package:flutter/widgets.dart';

import '../../models/movie/movie.dart';
import '../../services/metadata/localized_movie_metadata.dart';
import '../../services/metadata/tmdb_service.dart';

/// Keeps the existing layout and original identity. Only the display string
/// changes when a trusted Chinese title is available.
class LocalizedMovieTitle extends StatefulWidget {
  const LocalizedMovieTitle({
    super.key,
    required this.movie,
    required this.builder,
  });

  final Movie movie;
  final Widget Function(BuildContext context, String title, bool localized)
  builder;

  @override
  State<LocalizedMovieTitle> createState() => _LocalizedMovieTitleState();
}

class _LocalizedMovieTitleState extends State<LocalizedMovieTitle> {
  String? _locale;
  Future<LocalizedMovieText?>? _future;
  int _revision = 0;

  @override
  void initState() {
    super.initState();
    TmdbService.apiKey.addListener(_credentialChanged);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final locale = Localizations.localeOf(context).languageCode;
    if (_locale != locale) {
      _locale = locale;
      _refresh();
    }
  }

  @override
  void didUpdateWidget(covariant LocalizedMovieTitle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.movie.id != widget.movie.id ||
        oldWidget.movie.type != widget.movie.type ||
        oldWidget.movie.name != widget.movie.name) {
      _refresh();
    }
  }

  void _credentialChanged() {
    if (mounted && _locale == 'zh') setState(_refresh);
  }

  void _refresh() {
    final revision = ++_revision;
    _future = _locale == 'zh' && TmdbService.isConfigured
        ? LocalizedMovieMetadata.lookupCatalog(
            widget.movie,
            'zh',
            isCurrent: () => mounted && revision == _revision,
          )
        : null;
  }

  @override
  void dispose() {
    TmdbService.apiKey.removeListener(_credentialChanged);
    _revision++;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_locale == 'zh' && widget.movie.type == 'anime' &&
        widget.movie.id.startsWith('anilist_')) {
      final id = int.tryParse(widget.movie.id.substring(8));
      final title = id == null ? null : AnimeChineseTitles.lookup(anilistId: id);
      if (title != null) return widget.builder(context, title, true);
    }
    final future = _future;
    if (future == null)
      return widget.builder(context, widget.movie.name, false);
    return FutureBuilder<LocalizedMovieText?>(
      future: future,
      builder: (context, snapshot) {
        final title = snapshot.connectionState == ConnectionState.done
            ? snapshot.data?.title
            : null;
        return widget.builder(
          context,
          title ?? widget.movie.name,
          title != null,
        );
      },
    );
  }
}
