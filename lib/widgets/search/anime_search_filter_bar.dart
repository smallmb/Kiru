import 'package:flutter/material.dart';
import '../../l10n/l10n.dart';
import '../../l10n/media_labels.dart';
import '../../services/search/anime_search_filters.dart';
import '../../services/theme/design_tokens.dart';
import '../ui/kiru_controls.dart';

class AnimeSearchFilterBar extends StatelessWidget {
  const AnimeSearchFilterBar({
    super.key,
    required this.filters,
    required this.onChanged,
  });
  final AnimeSearchFilters filters;
  final ValueChanged<AnimeSearchFilters> onChanged;
  static const genres = [
    'Action',
    'Adventure',
    'Comedy',
    'Drama',
    'Ecchi',
    'Fantasy',
    'Horror',
    'Mahou Shoujo',
    'Mecha',
    'Music',
    'Mystery',
    'Psychological',
    'Romance',
    'Sci-Fi',
    'Slice of Life',
    'Sports',
    'Supernatural',
    'Thriller',
  ];
  static const seasons = ['WINTER', 'SPRING', 'SUMMER', 'FALL'];
  static const formats = [
    'TV',
    'TV_SHORT',
    'MOVIE',
    'OVA',
    'ONA',
    'SPECIAL',
    'MUSIC',
  ];
  static const statuses = [
    'RELEASING',
    'FINISHED',
    'NOT_YET_RELEASED',
    'CANCELLED',
    'HIATUS',
  ];

  static Widget menu(
    BuildContext context,
    String key,
    String title,
    String? value,
    List<String> options, {
    required ValueChanged<String?> onSelected,
    String prefix = 'anime',
    String Function(String)? optionLabel,
  }) {
    final tokens = context.tokens;
    return KiruPopupMenu<String>(
      key: ValueKey('kiru-$prefix-filter-$key'),
      initialValue: value ?? '',
      tooltip: title,
      itemBuilder: (_) => [
        PopupMenuItem(value: '', child: Text(l10nOf(context).uiMyListPageAll)),
        for (final option in options)
          PopupMenuItem(
            value: option,
            child: Text(
              optionLabel?.call(option) ?? mediaLabel(context, option),
            ),
          ),
      ],
      onSelected: (v) => onSelected(v.isEmpty ? null : v),
      child: Container(
        decoration: BoxDecoration(
          color: tokens.textPrimary.withValues(alpha: .06),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              value == null
                  ? title
                  : (optionLabel?.call(value) ?? mediaLabel(context, value)),
              style: ZplayType.label.toStyle(
                color: value == null ? tokens.textSecondary : tokens.accent,
              ),
            ),
            const SizedBox(width: 5),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 16,
              color: tokens.textSecondary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _menu(
    BuildContext context,
    String key,
    String title,
    String? value,
    List<String> options,
  ) => menu(
    context,
    key,
    title,
    value,
    options,
    onSelected: (v) => onChanged(filters.change(key, v)),
  );

  @override
  Widget build(BuildContext context) {
    final l = l10nOf(context);
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            _menu(
              context,
              'genre',
              l.uiAnimeSearchPageGenre,
              filters.genre,
              genres,
            ),
            const SizedBox(width: 8),
            _menu(
              context,
              'year',
              l.uiAnimeSearchPageReleaseYear,
              filters.year?.toString(),
              [
                for (int y = DateTime.now().year + 1; y >= 1960; y--)
                  y.toString(),
              ],
            ),
            const SizedBox(width: 8),
            _menu(
              context,
              'season',
              l.uiAnimeSearchPageSeason,
              filters.season,
              seasons,
            ),
            const SizedBox(width: 8),
            _menu(
              context,
              'format',
              l.uiAnimeSearchPageFormat,
              filters.format,
              formats,
            ),
            const SizedBox(width: 8),
            _menu(
              context,
              'status',
              l.uiAnimeSearchPageStatus,
              filters.status,
              statuses,
            ),
            if (filters.active) ...[
              const SizedBox(width: 8),
              KiruButton(
                kind: KiruButtonKind.ghost,
                compact: true,
                onPressed: () => onChanged(const AnimeSearchFilters()),
                child: Text(l.uiAnimeSearchPageReset),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
