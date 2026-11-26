import 'package:flutter/widgets.dart';
import '../models/anime/anime_media.dart';
import '../services/metadata/anime_chinese_titles.dart';

String localizedAnimeTitle(BuildContext context, AnimeMedia anime) {
  if (Localizations.localeOf(context).languageCode != 'zh' || anime.isArabic) {
    return anime.displayTitle;
  }
  if (anime.titleChinese.trim().isNotEmpty) return anime.titleChinese;
  return AnimeChineseTitles.lookup(anilistId: anime.id, malId: anime.idMal) ??
      anime.displayTitle;
}

String localizedAnimeRelationTitle(
  BuildContext context,
  AnimeRelation relation,
) {
  if (Localizations.localeOf(context).languageCode != 'zh')
    return relation.title;
  return AnimeChineseTitles.lookup(anilistId: relation.id) ?? relation.title;
}
