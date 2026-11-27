# Unified media search

One SearchPage accepts the global header query and anime catalogue search.
The latter selects the Anime category, and the header keeps that category while
the user remains in Search. Switching categories and sorting filters the
already fetched result set without requesting providers again.

The existing IMDb/Cinemeta, Stremio and active CloudStream adapters retain their
callbacks. The configured AnimeMetadataService searches concurrently with film providers. The Arabic catalogue is no longer exposed in browse or queried by unified search; legacy detail routes remain for saved media. Results retain Movie, AnimeMedia or ArabicAnimeCard payloads;
details and playback are still opened by their original routes. Canonical IMDb
ids deduplicate within media types; unrelated provider-specific ids are
namespaced and anime ids are not guessed from titles. Unknown media types
remain in All only. Search revisions reject old results and failures.

Ranking: exact title, prefix, substring, then original provider order. Chinese
and original anime title aliases participate in ranking. Newest and rating sort
the returned candidates; missing year and score appear last. These are not
exhaustive catalogue-wide rankings. Anime genre, year, season, format and status filters now live directly under the category tabs. They run against the configured anime metadata provider, including empty-query browsing. No advanced-filter route is required. The All discovery view includes film and anime shelves, while Anime has trending, seasonal and top-rated shelves. Providers without equivalent metadata are excluded only from the filtered anime set. Clearing filters restores the shared results or discovery shelves. URL/magnet, voice, history, and TV keyboard paths remain.

Short drama/documentary categories require explicit source metadata before
they can be added reliably. No live-source availability or playback guarantee
is implied by a catalogue result.


Film, series and variety categories now share inline genre, year, quarter and
status filters. Cinemeta advertises Reality-TV, Talk-Show and Game-Show under
series; these are classified as Variety without changing the original playback
type. Film/series genre and year catalogues use the advertised extras. Other
filters use known metadata, with bounded detail enrichment. Results with
missing required metadata are excluded from active filters. Catalogue browsing
and result sorting cover fetched candidates, not the entire provider database.
