import 'package:flutter/material.dart';
import '../../l10n/l10n.dart';
import '../../l10n/media_labels.dart';
import '../../services/search/film_search_filters.dart';
import '../../services/search/unified_search_result.dart';
import '../ui/kiru_controls.dart';
import 'anime_search_filter_bar.dart';

String varietyLabel(BuildContext context) => switch (Localizations.localeOf(
  context,
).languageCode) {
  'zh' => '\u7efc\u827a',
  'ar' =>
    '\u0628\u0631\u0627\u0645\u062c \u062a\u0631\u0641\u064a\u0647\u064a\u0629',
  _ => 'Variety',
};

class FilmSearchFilterBar extends StatelessWidget {
  const FilmSearchFilterBar({
    super.key,
    required this.category,
    required this.filters,
    required this.onChanged,
  });
  final SearchCategory category;
  final FilmSearchFilters filters;
  final ValueChanged<FilmSearchFilters> onChanged;
  static const genres = [
    'Action',
    'Adventure',
    'Animation',
    'Biography',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'History',
    'Horror',
    'Mystery',
    'Romance',
    'Sci-Fi',
    'Sport',
    'Thriller',
    'War',
    'Western',
  ];
  @override
  Widget build(BuildContext context) {
    final l = l10nOf(context);
    final zh = Localizations.localeOf(context).languageCode == 'zh';
    final isMovie = category == SearchCategory.movie;
    String label(String value) => switch (value) {
      'Reality-TV' => zh ? '\u771f\u4eba\u79c0' : 'Reality TV',
      'Talk-Show' => zh ? '\u8bbf\u8c08' : 'Talk show',
      'Game-Show' => zh ? '\u7ade\u8d5b\u8282\u76ee' : 'Game show',
      'RELEASED' => zh ? '\u5df2\u4e0a\u6620' : 'Released',
      _ => mediaLabel(context, value),
    };
    Widget menu(
      String key,
      String title,
      String? value,
      List<String> options, {
      String Function(String)? optionLabel,
    }) => AnimeSearchFilterBar.menu(
      context,
      key,
      title,
      value,
      options,
      prefix: 'film',
      optionLabel: optionLabel ?? label,
      onSelected: (v) => onChanged(filters.change(key, v)),
    );
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            menu(
              'genre',
              category == SearchCategory.variety
                  ? l.uiAnimeSearchPageFormat
                  : l.uiAnimeSearchPageGenre,
              filters.genre,
              category == SearchCategory.variety
                  ? UnifiedSearchResult.varietyGenres
                  : genres,
            ),
            const SizedBox(width: 8),
            menu(
              'year',
              l.uiAnimeSearchPageReleaseYear,
              filters.year?.toString(),
              [
                for (var y = DateTime.now().year + 1; y >= 1920; y--)
                  y.toString(),
              ],
            ),
            const SizedBox(width: 8),
            menu(
              'quarter',
              zh ? '\u5b63\u5ea6' : 'Release quarter',
              filters.quarter?.toString(),
              const ['1', '2', '3', '4'],
              optionLabel: (v) => zh ? '\u7b2c' + v + '\u5b63\u5ea6' : 'Q' + v,
            ),
            const SizedBox(width: 8),
            menu(
              'status',
              isMovie
                  ? (zh ? '\u4e0a\u6620\u72b6\u6001' : 'Release status')
                  : l.uiAnimeSearchPageStatus,
              filters.status,
              isMovie
                  ? const ['RELEASED', 'NOT_YET_RELEASED']
                  : const [
                      'RELEASING',
                      'FINISHED',
                      'NOT_YET_RELEASED',
                      'CANCELLED',
                    ],
            ),
            if (filters.active) ...[
              const SizedBox(width: 8),
              KiruButton(
                kind: KiruButtonKind.ghost,
                compact: true,
                onPressed: () => onChanged(const FilmSearchFilters()),
                child: Text(l.uiAnimeSearchPageReset),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
