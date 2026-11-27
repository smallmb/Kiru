import '../../services/search/film_search_filters.dart';
import '../../widgets/search/film_search_filter_bar.dart';
import '../../services/theme/forui_theme.dart';
import '../../services/search/unified_search_result.dart';
import '../../models/anime/anime_media.dart';
import '../../services/anime/anime_metadata_service.dart';
import '../../services/anime/anime_source_settings.dart';
import '../../services/content/content_settings.dart';
import '../../widgets/anime/anime_card.dart';
import '../../widgets/common/segmented_tabs.dart';
import '../../utils/navigation/route_transitions.dart';
import '../anime/anime_details_page.dart';
import '../../services/search/anime_search_filters.dart';
import '../../widgets/search/anime_search_filter_bar.dart';
import '../../widgets/anime/anime_slider_section.dart';
import '../anime_arabic/anime_arabic_details_page.dart';
import '../../widgets/ui/kiru_toast.dart';
import '../../widgets/ui/kiru_controls.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../l10n/l10n.dart';
import '../../models/addon/addon.dart';
import '../../models/movie/movie.dart';
import '../../models/movie/movie_section.dart';
import '../../models/stream/stream_model.dart';
import '../../services/addon/addon_manager.dart';
import '../../services/cloudstream/cloudstream_manager.dart';
import '../../services/diagnostics/diagnostics_export.dart';
import '../../services/home/home_page_settings.dart';
import '../../services/metadata/metadata_service.dart';
import '../../services/layout/form_factor.dart';
import '../../services/platform/voice_search.dart';
import '../../services/theme/app_theme_service.dart';
import '../../services/theme/design_tokens.dart';
import '../../shell/app_shell_scope.dart';
import '../../widgets/common/animated_ambient_background.dart';
import '../../widgets/common/error_view.dart';
import '../../widgets/common/focusable_card.dart';
import '../../widgets/common/section_header.dart';
import '../../widgets/movie/movie_card.dart';
import '../../widgets/movie/movie_slider_section.dart';
import '../../widgets/search/magnet_files_view.dart';
import '../../widgets/search/tv_on_screen_keyboard.dart';
import '../ai/wewatch_quiz_page.dart';
import '../player/player_screen.dart';

/// What a finished search should show.
enum SearchOutcome {
  /// Every source answered and none of them matched the query.
  noResults,

  /// Every source answered and at least one matched.
  complete,

  /// Some sources answered and some threw: the list is real but partial.
  incomplete,

  /// Nothing came back because sources threw. The catalog is not proven empty.
  failed,
}

/// What a finished search should show, given what came back and what threw.
/// Top level and pure so the three-way split is decided in exactly one place
/// and can be exercised without a widget tree, a network, or an addon install.
SearchOutcome classifySearchResult({
  required int resultCount,
  required int failureCount,
}) {
  if (failureCount == 0) {
    return resultCount == 0 ? SearchOutcome.noResults : SearchOutcome.complete;
  }
  return resultCount == 0 ? SearchOutcome.failed : SearchOutcome.incomplete;
}

/// Hand a voice transcript to the field: fill it, then run exactly that query.
///
/// A top-level function rather than a method on the page because the page's
/// search owns three network legs - addons, CloudStream and the title rail - so
/// a test that pressed the microphone would fire all three at the real
/// internet. This is the whole of what a transcript does to the page, and as a
/// plain function it can be proven without a widget tree: the controller is
/// written, the page is told the text changed, and the query is run, in that
/// order, the same order the clipboard paste already uses.
///
/// The transcript is nullable and emptiness returns early, because a `null`
/// result is a cancellation - the user backed out without speaking - and must
/// leave the field exactly as it was rather than clearing it. A recognizer that
/// heard silence also returns no text, and an empty query is not one to run.
@visibleForTesting
void applyVoiceTranscript(
  String? transcript, {
  required TextEditingController controller,
  required void Function(String) onChanged,
  required void Function(String) onSearch,
}) {
  final text = transcript?.trim() ?? '';
  if (text.isEmpty) return;
  controller.text = text;
  onChanged(text);
  onSearch(text);
}

/// Which legs of a search died, and how many sources the run expected to hear
/// back from. The page used to throw all of this away, so a dead addon, an
/// expired CloudStream runtime and being offline all rendered the same screen
/// as a title that does not exist. Search is the only route to a title the
/// user already has in mind, so that silence cost far more than the failure.
class SearchFailureLedger {
  /// Leg names in the order they threw, for the error copy.
  final List<String> sourceErrors = [];

  /// How many sources this run queried, the denominator in "X of Y".
  int searchedSourceCount = 0;

  int get failedSources => sourceErrors.length;

  /// Clearing the field abandons the query, so its failures must not survive
  /// into the next search and be blamed on the next title.
  void reset() {
    sourceErrors.clear();
    searchedSourceCount = 0;
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    this.initialCategory = SearchCategory.all,
    this.animeMetadata,
  });
  final SearchCategory initialCategory;
  final AnimeMetadataService? animeMetadata;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _focusNode = FocusNode();

  /// The microphone's own focus node, for the copy of it that is a control in
  /// its own right.
  ///
  /// Named here rather than left to the [FocusableCard]'s private one because
  /// [_leaveField] has to be able to hand the ring to it: BACK out of the field
  /// lands on the control nearest it, which is this one.
  final FocusNode _micFocusNode = FocusNode(debugLabel: 'Search microphone');

  // The field's box card's own node, and the node this page publishes to the
  // shell's bar while Search is the slot on screen (`_publishChromeEntry`).
  final FocusNode _fieldNode = FocusNode(debugLabel: 'Search field box');

  /// The app's own keyboard, on a television only, and whether it is up.
  ///
  /// The platform's cannot be used: a focused `TextField` installs
  /// `DirectionalFocusAction.forTextField()`, which consumes every arrow press
  /// so the caret can move, and the IME it raised never sees them. Measured on
  /// the Google TV emulator - Gboard appears, and `DPAD_RIGHT`/`DPAD_CENTER` do
  /// nothing at all. `TvOnScreenKeyboard` edits the same controller instead, so
  /// the field, its text and [_onSearchChanged] are unchanged.
  final GlobalKey<TvOnScreenKeyboardState> _tvKeyboardKey =
      GlobalKey<TvOnScreenKeyboardState>();
  bool _tvKeyboardOpen = false;

  /// The shell this page is mounted inside, or null when it is mounted alone -
  /// which is what the widget tests that pump the page on its own, and a route
  /// pushed above the shell, both are. [AppShellScope.of] answers null rather
  /// than throwing for exactly this case.
  AppShellController? _shell;

  /// Gives up BACK while the keyboard is up, or null when it is not.
  ///
  /// See `AppShellController.claimBack`: the keyboard cannot keep the press to
  /// itself from a key handler, because Android's back reaches the shell on the
  /// `popRoute` path regardless. This is how the press is actually routed here.
  VoidCallback? _releaseBackClaim;

  /// What the shell's row handle held when this page took it, so the handle can
  /// be *given back* rather than emptied on the way out. See
  /// [_publishChromeEntry].
  FocusNode? _handedOver;

  Timer? _debounce;
  bool _isLoading = false;
  final List<MovieSection> _results = [];
  String _lastQuery = '';
  late SearchCategory _category = widget.initialCategory;
  SearchSort _sort = SearchSort.relevance;
  List<AnimeMedia> _animeResults = [];
  int _searchRevision = 0;

  AnimeMetadataService get _animeMetadata =>
      widget.animeMetadata ?? AnimeMetadataService.instance;
  AnimeSearchFilters _animeFilters = const AnimeSearchFilters();
  List<AnimeMedia> _filteredAnime = [];
  bool _loadingFilteredAnime = false;
  Object? _filterError;
  int _filterRevision = 0;
  List<List<AnimeMedia>> _animeDiscovery = [];
  bool _loadingAnimeDiscovery = false;
  bool _animeDiscoveryRequested = false;
  int _discoveryRevision = 0;
  bool get _usesAnimeFilters =>
      _category == SearchCategory.anime &&
      (_animeFilters.active ||
          (_lastQuery.isEmpty && _sort != SearchSort.relevance));

  List<AnimeMedia> _safeAnime(List<AnimeMedia> items) => items
      .where((a) => ContentSettings.adultEnabled.value || !a.isAdult)
      .toList();

  void _selectCategory(SearchCategory category) {
    setState(() => _category = category);
    if (category == SearchCategory.anime || category == SearchCategory.all) {
      _loadAnimeDiscovery();
    }
    _runAnimeFilters(_lastQuery);
    _runFilmBrowse();
  }

  Future<void> _loadAnimeDiscovery({bool refresh = false}) async {
    if (_animeDiscoveryRequested && !refresh) return;
    _animeDiscoveryRequested = true;
    final revision = ++_discoveryRevision;
    setState(() {
      _loadingAnimeDiscovery = true;
      _animeDiscovery = [];
    });
    final service = _animeMetadata;
    Future<List<AnimeMedia>> safe(
      Future<List<AnimeMedia>> Function() load,
    ) async {
      try {
        return _safeAnime(await load());
      } catch (_) {
        return [];
      }
    }

    final lists = await Future.wait([
      safe(() => service.fetchTrendingAnime(perPage: 20)),
      safe(() => service.fetchPopularThisSeason(perPage: 20)),
      safe(() => service.fetchTopRated(perPage: 20)),
    ]);
    if (!mounted || revision != _discoveryRevision) return;
    setState(() {
      _animeDiscovery = lists;
      _loadingAnimeDiscovery = false;
    });
  }

  void _setAnimeFilters(AnimeSearchFilters value) {
    setState(() => _animeFilters = value);
    _runAnimeFilters(_lastQuery);
  }

  Future<void> _runAnimeFilters(String query) async {
    final revision = ++_filterRevision;
    setState(() {
      _filteredAnime = [];
      _filterError = null;
      _loadingFilteredAnime = _usesAnimeFilters;
    });
    if (!_usesAnimeFilters) return;
    final sort = query.isNotEmpty
        ? 'SEARCH_MATCH'
        : switch (_sort) {
            SearchSort.relevance => 'TRENDING_DESC',
            SearchSort.newest => 'START_DATE_DESC',
            SearchSort.rating => 'SCORE_DESC',
          };
    try {
      final items = await _animeFilters.search(
        query,
        sort: sort,
        service: _animeMetadata,
      );
      if (!mounted || revision != _filterRevision) return;
      setState(() {
        _filteredAnime = _safeAnime(items);
        _loadingFilteredAnime = false;
      });
    } catch (error) {
      if (!mounted || revision != _filterRevision) return;
      setState(() {
        _filterError = error;
        _loadingFilteredAnime = false;
      });
    }
  }

  final _filmFiltersByCategory = <SearchCategory, FilmSearchFilters>{};
  FilmSearchFilters get _filmFilters =>
      _filmFiltersByCategory[_category] ?? const FilmSearchFilters();
  bool get _isFilmCategory =>
      _category == SearchCategory.movie ||
      _category == SearchCategory.series ||
      _category == SearchCategory.variety;
  bool get _usesFilmBrowse =>
      _isFilmCategory &&
      _lastQuery.isEmpty &&
      (_filmFilters.active ||
          _category == SearchCategory.variety ||
          _sort != SearchSort.relevance);
  List<MovieSection> _filmBrowseSections = [];
  bool _loadingFilmBrowse = false;
  int _filmBrowseRevision = 0;
  bool _enrichingFilm = false;

  void _setFilmFilters(FilmSearchFilters filters) {
    setState(() => _filmFiltersByCategory[_category] = filters);
    _runFilmBrowse();
  }

  Future<void> _runFilmBrowse() async {
    final revision = ++_filmBrowseRevision;
    setState(() {
      _filmBrowseSections = [];
      _loadingFilmBrowse = _usesFilmBrowse;
    });
    if (!_usesFilmBrowse) return;
    final category = _category;
    final filters = _filmFilters;
    final sections = await FilmSearchCatalogs.browse(category, filters);
    if (!mounted || revision != _filmBrowseRevision || !_usesFilmBrowse) return;
    setState(() => _filmBrowseSections = sections);
    // Quarter and status may need a detail lookup; keep other results visible.
    if (filters.quarter != null || filters.status != null) {
      final candidates = [...sections, ..._suggestedSections]
          .map(
            (s) => MovieSection(
              title: s.title,
              subtitle: s.subtitle,
              contentType: s.contentType,
              addonBaseUrl: s.addonBaseUrl,
              catalog: s.catalog,
              movies: s.movies
                  .where(
                    (m) => UnifiedSearchResult.movie(m).category == category,
                  )
                  .toList(),
            ),
          )
          .toList();
      final enriched = await FilmSearchCatalogs.enrich(candidates);
      if (!mounted || revision != _filmBrowseRevision || !_usesFilmBrowse)
        return;
      setState(() => _filmBrowseSections = enriched);
    }
    if (mounted && revision == _filmBrowseRevision)
      setState(() => _loadingFilmBrowse = false);
  }

  bool get _hasResults => _results.isNotEmpty || _animeResults.isNotEmpty;
  List<UnifiedSearchResult> get _visibleResults {
    final results = collectUnifiedResults(
      _usesAnimeFilters
          ? const []
          : _usesFilmBrowse
          ? [..._filmBrowseSections, ..._suggestedSections]
          : _results,
      _usesAnimeFilters ? _filteredAnime : _animeResults,
      const [],
      query: _lastQuery,
      category: _category,
      sort: _sort,
    );
    return _isFilmCategory && _filmFilters.active
        ? results
              .where((r) => r.movie != null && _filmFilters.matches(r.movie!))
              .toList()
        : results;
  }

  void _clearResults() {
    _results.clear();
    _enrichingFilm = false;
    _animeResults = [];
  }

  void _onCategoryRequest() {
    final request = _shell?.searchCategoryRequest.value;
    if (!mounted || request == null) return;
    _shell!.searchCategoryRequest.value = null;
    _selectCategory(request);
  }

  void _onAnimeSourceChanged() {
    if (!mounted) return;
    if (_animeDiscoveryRequested) _loadAnimeDiscovery(refresh: true);
    if (_lastQuery.isNotEmpty && !_isMagnetMode) {
      final query = _searchController.text.trim();
      if (query.isNotEmpty) _performSearch(query);
    } else if (_usesAnimeFilters) {
      _runAnimeFilters('');
    }
  }

  /// Synthetic catalog id for the keyless title rail. There is no addon
  /// catalog behind it, so its slider hides See All.
  static const String _titleRailCatalogId = 'imdb_titles';

  /// Each leg is one source the user believes is answering. The addon leg
  /// fans out internally, so a dead addon surfaces as one failure here.
  static const int _addonSearchSourceCount = 1;
  static const int _cloudStreamSearchSourceCount = 1;
  static const int _titleSearchSourceCount = 1;

  final SearchFailureLedger _ledger = SearchFailureLedger();

  bool _isMagnetMode = false;
  String _magnetQuery = '';

  /// The legs a run can hit, and so the denominator the user is shown. A leg
  /// with nothing to search (no CloudStream extension enabled) is not a source
  /// anyone expects an answer from, so it stays out of the count.
  static int _searchedSourceTotalFor({required String query}) {
    if (query.isEmpty) return 0;
    return _titleSearchSourceCount +
        _addonSearchSourceCount +
        (CloudStreamManager.instance.activeExtensions.isNotEmpty
            ? _cloudStreamSearchSourceCount
            : 0);
  }

  SearchOutcome get _outcome => classifySearchResult(
    resultCount: _hasResults ? 1 : 0,
    failureCount: _ledger.failedSources,
  );

  void _recordSourceFailure(String source, Object error) {
    debugPrint('[SearchPage] $source search error: $error');
    // A leg that fails late must not resurrect a query the user has moved on
    // from, and setState after dispose throws.
    if (!mounted) return;
    setState(() {
      _ledger.sourceErrors.add(source);
    });
  }

  /// The service callbacks fire from code that knows nothing about the current
  /// query, so a failure arriving after the user has moved on would be blamed
  /// on the new title. Each leg gets a recorder pinned to its own query.
  void Function(String source, Object error) _sourceErrorRecorderFor(
    String query,
    int revision,
  ) {
    return (source, error) {
      if (!mounted || _lastQuery != query || _searchRevision != revision) {
        return;
      }
      _recordSourceFailure(source, error);
    };
  }

  List<String> _searchHistory = [];
  List<MovieSection> _suggestedSections = [];
  bool _isLoadingSuggestions = true;

  /// Whether the platform reported a recognizer, which is the only thing that
  /// puts a microphone beside the field. False until the answer arrives, so the
  /// field paints and accepts input before any channel round trip.
  bool _voiceAvailable = false;

  /// How far the body has scrolled, as 0..1 for the search band's tint.
  ///
  /// The band carries the field and nothing else, so at the top of the page it
  /// is transparent and the canvas shows through. Results scroll *under* it, so
  /// past a nudge it has to paint or a rail heading would draw across the field
  /// unreadably - the same failure Home's glass bar tints its way out of, and
  /// deliberately the same distance (`AppShell._navBlendThreshold`), so the
  /// shell's own bar and this one settle together.
  ///
  /// A value, not an animation, and it rebuilds the band's decoration only: the
  /// field inside is built once and handed to the [ValueListenableBuilder] as
  /// its `child`, so typing is never rebuilt by scrolling and nothing moves.
  static const double _bandBlendThreshold = 32.0;
  final ValueNotifier<double> _bandTint = ValueNotifier<double>(0);

  /// The body's own scroll feeds the band, because the band is inside the
  /// `appBar` slot and cannot listen to it from there.
  bool _onBodyScroll(ScrollNotification notification) {
    // Vertical only. The rails inside the results are horizontal scrollables
    // whose offset says nothing about how far the page has travelled under the
    // band - a rail nudged one poster to the right would otherwise drag the
    // band's tint to full as if the page had scrolled a whole screen.
    if (notification.metrics.axis != Axis.vertical) return false;
    final t = (notification.metrics.pixels / _bandBlendThreshold).clamp(
      0.0,
      1.0,
    );
    if ((_bandTint.value - t).abs() > 0.01) _bandTint.value = t;
    // Nobody else's business: the field is the only consumer.
    return false;
  }

  @override
  void initState() {
    super.initState();
    AnimeSourceSettings.revision.addListener(_onAnimeSourceChanged);
    ContentSettings.adultEnabled.addListener(_onAnimeSourceChanged);
    // The field's own node answers BACK and `escape`; see [_onFieldKeyEvent] for
    // why the handler has to live here rather than on a widget above the field.
    _focusNode.onKeyEvent = _onFieldKeyEvent;
    // **And on a television it is not a traversal candidate at all.** A focused
    // `EditableText` answers every arrow key itself - that is the trap this page
    // is named for - so a field the remote can walk *into* is a field it cannot
    // walk out of. What a television lands on is the control [_fieldBox] wraps
    // the field's box in, and the centre button on that control raises the
    // app's own keyboard ([_openTvKeyboard]) instead of focusing the field.
    _focusNode.skipTraversal = FormFactorService.hasRemoteInput;
    FocusManager.instance.addListener(_onFocusChanged);
    HardwareKeyboard.instance.addHandler(_onFieldKeyUp);
    _loadSearchHistory();
    _loadSuggestions();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted &&
          (_shell == null || _shell!.current.value == ShellSlot.search)) {
        _loadAnimeDiscovery();
        if (_usesFilmBrowse) _runFilmBrowse();
      }
    });
    // After the first frame, never before: the field must paint and take input
    // immediately, and a channel round trip on the frame that opens the page
    // would put the microphone's existence between the user and the keyboard.
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _resolveVoiceAvailability(),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Read here rather than in `initState`, where an inherited lookup is not yet
    // legal. The shell keeps one controller for its whole life; a rebuild that
    // replaces the scope hands over a new instance, and the listener is swapped
    // only when it actually differs.
    final shell = AppShellScope.of(context);
    if (identical(shell, _shell)) return;
    _shell?.current.removeListener(_onSlotChanged);
    _shell?.headerSearch.removeListener(_onHeaderSearch);
    _shell?.searchCategoryRequest.removeListener(_onCategoryRequest);
    _shell = shell;
    shell?.current.addListener(_onSlotChanged);
    shell?.headerSearch.addListener(_onHeaderSearch);
    shell?.searchCategoryRequest.addListener(_onCategoryRequest);
    if (shell?.searchCategoryRequest.value != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) => _onCategoryRequest());
    }
    if (shell?.headerSearch.value != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) _onHeaderSearch();
      });
    }
    _publishChromeEntry();
  }

  /// The page's own row, as the shell's bar sees it.
  ///
  /// The field's box, on a television, while Search is the slot being shown - and
  /// nothing else. A telephone or a desk window has its field focused by a
  /// pointer, where the bar has no business reaching; and a slot nobody is
  /// looking at has no row on screen, so it publishes nothing.
  FocusNode? get _chromeEntry =>
      FormFactorService.hasRemoteInput &&
          _shell?.current.value == ShellSlot.search &&
          _fieldNode.context != null &&
          _fieldNode.canRequestFocus
      ? _fieldNode
      : null;

  /// Hands the field's box to the shell's bar, and takes the handle back again.
  ///
  /// `AppShellController.pageTopChrome` is one field shared by every slot page
  /// with a row of its own, so two rules apply. It is only published while Search
  /// is the slot being shown ([_chromeEntry]), and when this page withdraws it
  /// hands back what it took ([_handedOver]) instead of clearing it: an emptied
  /// handle would take Home's calendar down with it until Home happened to
  /// rebuild.
  void _publishChromeEntry() {
    final shell = _shell;
    if (shell == null) return;
    final entry = _chromeEntry;
    if (entry == null) {
      _handBackChromeEntry();
      return;
    }
    if (identical(shell.pageTopChrome, entry)) return;
    _handedOver = shell.pageTopChrome;
    shell.pageTopChrome = entry;
  }

  /// Gives the handle back to whatever held it before this page took it.
  ///
  /// Only if the handle is still ours to give back: another slot page may have
  /// published over it in the meantime, and that claim is not this page's to
  /// revoke. Deliberately not routed through [_chromeEntry] - the caller may be
  /// `dispose`, where the box's node is on its way out and the answer is only
  /// ever "give it back".
  void _handBackChromeEntry() {
    final shell = _shell;
    final previous = _handedOver;
    _handedOver = null;
    if (shell == null || previous == null) return;
    if (identical(shell.pageTopChrome, _fieldNode)) {
      shell.pageTopChrome = previous;
    }
  }

  /// The slot changed, so whether this page owns the bar's row handle may have.
  ///
  /// Read **after the frame and not during it**, because a slot change is
  /// notified before the shell repaints (`_AppShellState._select` says so
  /// explicitly): at this instant the page is still a hidden slot, its box is
  /// still inside an `ExcludeFocus`, and the answer would be "nothing to
  /// publish" - which is how this first went wrong on a device.
  void _onHeaderSearch() {
    final shell = _shell;
    final query = shell?.headerSearch.value;
    if (!mounted || shell == null || query == null) return;
    shell.headerSearch.value = null;
    _debounce?.cancel();
    _searchController.text = query;
    if (query.isEmpty) {
      _onSearchChanged(query);
    } else {
      _performSearch(query);
    }
  }

  void _onSlotChanged() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _publishChromeEntry();
        if (_shell?.current.value == ShellSlot.search &&
            (_category == SearchCategory.all ||
                _category == SearchCategory.anime)) {
          _loadAnimeDiscovery();
        }
      }
    });
  }

  /// Re-states this page's claim on the bar's row handle whenever focus moves.
  ///
  /// `pageTopChrome` is one field and `HomePage` writes it on every one of its
  /// own rebuilds, without asking which slot is on screen - so a claim made once
  /// at a slot change is a claim Home can take straight back, which is exactly
  /// what a device did. A remote reaches a bar row by moving focus, so re-stating
  /// the claim on every focus change means it is this page's again by the time
  /// the next key (the DOWN the bar hands over) is pressed. The early return in
  /// [_publishChromeEntry] makes the common case one identity check.
  void _onFocusChanged() {
    final shell = _shell;
    if (shell == null) return;
    if (shell.current.value != ShellSlot.search) return;
    _publishChromeEntry();
  }

  /// Eats the key-*up* half of a BACK this page's field already answered.
  ///
  /// The field's own handler cannot see it: answering a BACK moves the caret out
  /// of the field ([_leaveField]), so by the time the key comes back up the
  /// field's node is no longer in the focus path. An unhandled up is
  /// re-dispatched to Android, where BACK is the shell's (`shell_back_guard.dart`)
  /// - which is how the press that stepped out of the field also left Search.
  ///
  /// Only the up, and only while this page's slot is the one on screen: a BACK
  /// pressed anywhere else keeps exactly the meaning it had, and the down half is
  /// left to the field so that an ordinary BACK still reaches the shell once the
  /// field has let go.
  bool _onFieldKeyUp(KeyEvent event) {
    if (event is! KeyUpEvent) return false;
    if (!FormFactorService.hasRemoteInput) return false;
    if (event.logicalKey != LogicalKeyboardKey.escape &&
        event.logicalKey != LogicalKeyboardKey.goBack) {
      return false;
    }
    if (_shell?.current.value != ShellSlot.search) return false;
    // **And it is the press, when the caret is still in the field.** The platform
    // keyboard takes the key-down for itself while it is showing, so the up is
    // the only half of the press this page ever hears - and a press that closes
    // the keyboard and then leaves the caret where it was would still be the trap.
    //
    // `_focusNode`, not `_fieldNode`: `hasFocus` answers true for the node *or
    // any descendant*, and the box card contains the field. The box is also
    // where the ring sits after the app's own keyboard closes, and a BACK that
    // closed a keyboard must not go on to move the ring somewhere else.
    if (_focusNode.hasFocus) _leaveField();
    return true;
  }

  /// Ask the platform once whether it has a recognizer, and let the answer
  /// decide whether a microphone exists at all.
  ///
  /// A control that exists and fails is worse than no control: on a television
  /// the user cannot tell a missing recognizer from a broken app, so there is
  /// nothing to show them.
  Future<void> _resolveVoiceAvailability() async {
    final available = await VoiceSearch.available();
    if (!mounted) return;
    setState(() => _voiceAvailable = available);
  }

  Future<void> _loadSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('search_history') ?? [];
    if (mounted) {
      setState(() {
        _searchHistory = history;
      });
    }
  }

  Future<void> _saveSearchHistory(String query) async {
    if (query.trim().isEmpty) return;
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('search_history') ?? [];
    history.remove(query);
    history.insert(0, query);
    if (history.length > 10) history.removeLast();
    await prefs.setStringList('search_history', history);
    if (mounted) {
      setState(() {
        _searchHistory = history;
      });
    }
  }

  Future<void> _removeSearchHistory(String query) async {
    final prefs = await SharedPreferences.getInstance();
    final history = prefs.getStringList('search_history') ?? [];
    history.remove(query);
    await prefs.setStringList('search_history', history);
    if (mounted) {
      setState(() {
        _searchHistory = history;
      });
    }
  }

  Future<void> _clearSearchHistory() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('search_history');
    if (mounted) {
      setState(() {
        _searchHistory = [];
      });
    }
  }

  Future<void> _loadSuggestions() async {
    try {
      final sections = await AddonManager.instance.fetchAllHomeSections();
      if (mounted) {
        setState(() {
          _suggestedSections = sections;
          _isLoadingSuggestions = false;
        });
      }
    } catch (_) {
      if (mounted) {
        setState(() {
          _isLoadingSuggestions = false;
        });
      }
    }
  }

  static bool _isMagnetLink(String text) {
    final trimmed = text.trim();
    if (trimmed.toLowerCase().startsWith('magnet:')) return true;
    if (RegExp(r'^[0-9a-fA-F]{40}$').hasMatch(trimmed)) return true;
    if (RegExp(r'^[a-zA-Z2-7]{32}$').hasMatch(trimmed)) return true;
    return false;
  }

  static bool _isStreamLink(String text) {
    final trimmed = text.trim();
    final lower = trimmed.toLowerCase();
    if (!lower.startsWith('http://') && !lower.startsWith('https://')) {
      return false;
    }
    return true;
  }

  void _playDirectStream(String url) {
    final trimmed = url.trim();
    final uri = Uri.tryParse(trimmed);
    final directStream = l10nOf(context).searchDirectStream;
    String title = directStream;
    if (uri != null && uri.pathSegments.isNotEmpty) {
      final last = uri.pathSegments.last;
      if (last.isNotEmpty) {
        title = Uri.decodeComponent(last);
      }
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PlayerScreen(
          source: StreamSource(
            name: directStream,
            title: title,
            url: trimmed,
            addonName: directStream,
          ),
          title: title,
        ),
      ),
    );
  }

  @override
  void dispose() {
    HardwareKeyboard.instance.removeHandler(_onFieldKeyUp);
    FocusManager.instance.removeListener(_onFocusChanged);
    _shell?.current.removeListener(_onSlotChanged);
    _shell?.headerSearch.removeListener(_onHeaderSearch);
    _shell?.searchCategoryRequest.removeListener(_onCategoryRequest);
    // Before the box's node goes anywhere: the shell's bar reads this handle at
    // key time, and a node this page is dismantling is not one it may hand the
    // remote to.
    _handBackChromeEntry();
    // A claim that outlived this page would eat the press that leaves the app.
    _releaseBackClaim?.call();
    _releaseBackClaim = null;
    _shell = null;
    AnimeSourceSettings.revision.removeListener(_onAnimeSourceChanged);
    ContentSettings.adultEnabled.removeListener(_onAnimeSourceChanged);
    _fieldNode.dispose();
    _micFocusNode.dispose();
    _searchController.dispose();
    _focusNode.dispose();
    _debounce?.cancel();
    _bandTint.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce!.cancel();

    final trimmed = query.trim();
    _shell?.searchText.value = query;
    _searchRevision++;
    _filterRevision++;
    if (trimmed.isEmpty) {
      setState(() {
        _clearResults();
        _isLoading = false;
        _lastQuery = '';
        _isMagnetMode = false;
        _magnetQuery = '';
        // Clearing the field abandons the query, so its failures must not
        // survive to be shown against the next one.
        _ledger.reset();
      });
      _runAnimeFilters('');
      _runFilmBrowse();
      return;
    }

    if (_isStreamLink(trimmed)) {
      setState(() {
        _isLoading = false;
        _lastQuery = '';
        _isMagnetMode = false;
        _magnetQuery = '';
        _clearResults();
        _ledger.reset();
      });
      _playDirectStream(trimmed);
      return;
    }

    if (_isMagnetLink(trimmed)) {
      setState(() {
        _isMagnetMode = true;
        _magnetQuery = trimmed;
        _lastQuery = '';
        _ledger.reset();
        _isLoading = false;
        _clearResults();
      });
      return;
    } else if (_isMagnetMode) {
      setState(() {
        _isMagnetMode = false;
        _magnetQuery = '';
      });
    }

    _debounce = Timer(const Duration(milliseconds: 600), () {
      _performSearch(trimmed);
    });
  }

  void _performSearch(String query) async {
    final trimmed = query.trim();
    if (trimmed.isEmpty) return;
    _shell?.searchText.value = trimmed;
    _debounce?.cancel();
    final revision = ++_searchRevision;

    if (_isStreamLink(trimmed)) {
      setState(() {
        _isLoading = false;
        _lastQuery = '';
        _isMagnetMode = false;
        _magnetQuery = '';
        _clearResults();
        _ledger.reset();
      });
      _playDirectStream(trimmed);
      return;
    }

    if (_isMagnetLink(trimmed)) {
      setState(() {
        _isMagnetMode = true;
        _magnetQuery = trimmed;
        _lastQuery = '';
        _ledger.reset();
        _isLoading = false;
        _clearResults();
      });
      return;
    }

    _saveSearchHistory(trimmed);

    setState(() {
      _isLoading = true;
      _lastQuery = trimmed;
      _isMagnetMode = false;
      _clearResults();
      // Failures belong to the query that produced them; carrying them into
      // the next search would blame the new query for the old outage.
      _ledger.reset();
      _ledger.searchedSourceCount = _searchedSourceTotalFor(query: trimmed) + 1;
    });

    _filmBrowseRevision++;
    _loadingFilmBrowse = false;
    if (_usesAnimeFilters) _runAnimeFilters(trimmed);
    final currentQuery = trimmed;
    final l10n = l10nOf(context);
    bool active() =>
        mounted && _lastQuery == currentQuery && _searchRevision == revision;
    final recordFailure = _sourceErrorRecorderFor(currentQuery, revision);

    void addSection(MovieSection section, {bool isCloudStream = false}) {
      if (!active()) return;
      if (section.movies.isEmpty) return;

      // Prevent duplicate sections
      final exists = _results.any(
        (s) =>
            s.title == section.title &&
            s.subtitle == section.subtitle &&
            s.addonBaseUrl == section.addonBaseUrl,
      );
      if (exists) return;

      setState(() {
        if (!isCloudStream &&
            (section.addonBaseUrl.contains('cinemeta') ||
                section.subtitle.toLowerCase().contains('cinemeta'))) {
          // Prioritize Cinemeta at the top
          _results.insert(0, section);
        } else {
          _results.add(section);
        }
      });
    }

    try {
      // 1. Search Stremio Addons with dynamic streaming
      final addonSearch = AddonManager.instance
          .searchAll(
            currentQuery,
            onSectionResult: (section) {
              addSection(section, isCloudStream: false);
            },
            onSourceError: recordFailure,
          )
          .catchError((e) {
            recordFailure('Addons', e);
            return <MovieSection>[];
          });

      // 2. Search CloudStream Extensions with dynamic streaming
      final csSearch =
          (CloudStreamManager.instance.activeExtensions.isNotEmpty
                  ? CloudStreamManager.instance.searchAcrossExtensions(
                      currentQuery,
                      onProviderResult: (providerName, items) {
                        if (!active()) return;
                        if (items.isEmpty) return;

                        final movies = <Movie>[];
                        for (final item in items) {
                          final title =
                              item['title']?.toString() ??
                              item['name']?.toString() ??
                              'Unknown';
                          final rawUrl = item['url']?.toString() ?? '';
                          final sourceId =
                              item['_sourceId']?.toString() ??
                              'cs_${providerName.toLowerCase().replaceAll(RegExp(r'[^a-z0-9]'), '')}';
                          final cover =
                              item['cover']?.toString() ??
                              item['poster']?.toString() ??
                              item['image']?.toString();
                          final isSeries =
                              item['type'] == 1 ||
                              item['type']?.toString().toLowerCase().contains(
                                    'series',
                                  ) ==
                                  true ||
                              item['type']?.toString().toLowerCase().contains(
                                    'tv',
                                  ) ==
                                  true ||
                              (item['extraData'] is Map &&
                                  (item['extraData'] as Map)['type']
                                          ?.toString()
                                          .toLowerCase()
                                          .contains('series') ==
                                      true);

                          movies.add(
                            Movie(
                              id: 'cloudstream:$sourceId:${Uri.encodeComponent(rawUrl)}',
                              name: title,
                              poster: cover,
                              year:
                                  item['year']?.toString() ??
                                  (item['extraData'] is Map
                                      ? (item['extraData'] as Map)['year']
                                            ?.toString()
                                      : null),
                              genres: Movie.parseGenres(
                                item['genres'] ??
                                    item['genre'] ??
                                    (item['extraData'] is Map
                                        ? (item['extraData'] as Map)['genres']
                                        : null),
                              ),
                              status: item['status']?.toString(),
                              releasedAt: DateTime.tryParse(
                                (item['released'] ?? item['release_date'] ?? '')
                                    .toString(),
                              ),
                              type: isSeries ? 'series' : 'movie',
                              addonBaseUrl: 'cloudstream',
                            ),
                          );
                        }

                        if (movies.isNotEmpty) {
                          final section = MovieSection(
                            title: l10n.searchCloudstreamSection(providerName),
                            subtitle: l10n.searchCloudstreamExtension,
                            contentType: 'movie',
                            addonBaseUrl: 'cloudstream',
                            catalog: AddonCatalog(
                              type: 'movie',
                              id: 'cs_$providerName',
                              name: providerName,
                            ),
                            movies: movies,
                          );
                          addSection(section, isCloudStream: true);
                        }
                      },
                      onSourceError: recordFailure,
                    )
                  : Future.value(<String, List<Map<String, dynamic>>>{}))
              .catchError((e) {
                recordFailure('CloudStream', e);
                return <String, List<Map<String, dynamic>>>{};
              });

      // 3. Keyless title lookup. An install whose only installed addon is
      // Cinemeta has no search catalog left, so without this the page would
      // report no results for every query.
      final titleSearch =
          MetadataService.suggestionSearch(
                query: currentQuery,
                onSourceError: recordFailure,
              )
              .then((movies) {
                addSection(
                  MovieSection(
                    title: l10n.searchTitlesSection,
                    subtitle: l10n.searchImdbSuggestions,
                    contentType: 'movie',
                    addonBaseUrl: 'https://v3-cinemeta.strem.io',
                    catalog: AddonCatalog(
                      type: 'movie',
                      id: _titleRailCatalogId,
                      name: 'Titles',
                    ),
                    movies: movies,
                  ),
                );
              })
              .catchError((e) {
                recordFailure(l10n.searchSourceTitleLookup, e);
              });

      final animeSearch = _animeMetadata
          .searchUnifiedAnime(currentQuery)
          .then((items) {
            if (!active()) return;
            setState(
              () => _animeResults = items
                  .where(
                    (a) => ContentSettings.adultEnabled.value || !a.isAdult,
                  )
                  .toList(),
            );
          })
          .catchError((Object e) => recordFailure('Anime', e));
      await Future.wait([addonSearch, csSearch, titleSearch, animeSearch]);
      if (active()) {
        setState(() => _enrichingFilm = true);
        final enriched = await FilmSearchCatalogs.enrich(
          List.of(_results),
          limit: 24,
        );
        if (active())
          setState(() {
            _results
              ..clear()
              ..addAll(enriched);
            _enrichingFilm = false;
          });
      }
    } catch (e) {
      // A leg that throws synchronously, or a Future.wait rejection that
      // outran the handlers above, is still a source that did not answer.
      recordFailure('Search', e);
    }

    if (active()) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _pasteFromClipboard() async {
    final data = await Clipboard.getData(Clipboard.kTextPlain);
    final text = data?.text?.trim();
    if (text != null && text.isNotEmpty) {
      _searchController.text = text;
      _onSearchChanged(text);
      if (!_isMagnetLink(text) && !_isStreamLink(text)) {
        _performSearch(text);
      }
    }
  }

  /// Hand the query to the platform's recognizer and put its answer in the
  /// field.
  ///
  /// The three outcomes are all different. A transcript runs the search like the
  /// clipboard paste does. A `null` is the user backing out without speaking,
  /// and touches nothing. A refusal is either `denied` - show the user something,
  /// because the microphone is fine and the permission is not - or `unavailable`
  /// - the recognizer went away, so stop offering the control rather than let the
  /// user press it into another failure.
  Future<void> _startVoiceSearch() async {
    final String? transcript;
    try {
      transcript = await VoiceSearch.listen();
    } on PlatformException catch (e) {
      if (!mounted) return;
      switch (e.code) {
        case 'denied':
          KiruToastMessenger.of(context).showSnackBar(
            KiruToast(
              content: Text(l10nOf(context).searchVoiceDenied),
              behavior: SnackBarBehavior.floating,
              backgroundColor: context.tokens.danger,
            ),
          );
        case 'unavailable':
          setState(() => _voiceAvailable = false);
        default:
          // `busy`, or a code this build does not know: the platform refused
          // one attempt, not the feature, so nothing is said and the control
          // stays where it is.
          break;
      }
      return;
    } catch (e) {
      debugPrint('[SearchPage] voice search failed: $e');
      return;
    }

    applyVoiceTranscript(
      transcript,
      controller: _searchController,
      onChanged: _onSearchChanged,
      // Mirrors the clipboard path: `_onSearchChanged` opens a link itself when
      // the transcript happens to be one, so the search must not open it twice.
      onSearch: (text) {
        if (!_isMagnetLink(text) && !_isStreamLink(text)) {
          _performSearch(text);
        }
      },
    );
  }

  /// The field's box, wrapped in the control a television can actually land on -
  /// and the node the shell's bar hands DOWN into.
  ///
  /// **Why the box needs a control of its own.** A focused `EditableText` answers
  /// every arrow key itself (`DirectionalFocusAction.forTextField()`), so a field
  /// the remote can walk *into* is a field it cannot walk out of: the arrows that
  /// should leave it move a caret through empty text instead. So on a television
  /// [_focusNode] is not a traversal candidate at all (`skipTraversal`, set in
  /// `initState`) and this card is: an ordinary [FocusableCard] wearing the house
  /// [CardFocusRing], whose centre button hands the field focus and, with it, the
  /// platform keyboard - which is how a remote starts typing.
  ///
  /// **And why the shell's bar needs it.** DOWN out of the bar is answered by the
  /// shell's own hand-over (`_TopChromeHandover` -> `_handOverDownToPage`) and by
  /// nothing else: measured in `test/tv_dpad_regression_test.dart`, where the
  /// remote stands on the bar's own Search row, an arrow key moves no focus at all
  /// - the only move that happens is the one the hand-over makes. That is why Home
  /// publishes its calendar glyph (`AppShellController.pageTopChrome`) and why
  /// this page publishes its box: without it, DOWN out of the bar leaves the
  /// remote where it was and no arrow ever reaches the band.
  ///
  /// **The focus boundary around the card is the shell's doing, not this page's.**
  /// `SkipPageShellFocus` marks every node inside a page whose *focus* parent is
  /// not, and which has a focus descendant inside the page, as untraversable
  /// **and unfocusable** (`SkipPageShellFocus._findPageNodes`) - right for the one
  /// node that covers a whole page, wrong for a card that wraps another control.
  /// Measured, not guessed: without the boundary the card came out with
  /// `canRequestFocus == false`, so nothing could land on it. It costs nothing -
  /// no key handling, no focus of its own, no traversal slot, no layout.
  ///
  /// A pointer device keeps the field exactly as it was, autofocus and all, and
  /// gets no card: a mouse focuses a text field by pointing at it.
  Widget _fieldBox({required bool isTelevision, required Widget child}) {
    if (!isTelevision) return child;
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      child: FocusableCard(
        focusNode: _fieldNode,
        // The centre button on the box is "start typing". On a television that
        // is the app's own keyboard, never the platform's: a focused field
        // raises an IME the remote cannot drive at all (see
        // [TvOnScreenKeyboard]), so the field itself is never focused here.
        onTap: _openTvKeyboard,
        builder: (context, state) => CardFocusRing(
          focused: state.focused,
          radius: ZplayRadius.smAll,
          child: child,
        ),
      ),
    );
  }

  /// Raises the app's keyboard and keeps the platform's away.
  ///
  /// The platform call is not redundant with the field never taking focus: a
  /// physical keyboard, a voice remote's text path or a stray `TextInput.show`
  /// from the framework can leave the IME up, and an IME drawn over the app's
  /// keyboard is the exact overlap that made the field look usable and be
  /// unusable.
  void _openTvKeyboard() {
    if (_tvKeyboardOpen) return;
    setState(() => _tvKeyboardOpen = true);
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
    // BACK now belongs to the keyboard until it closes. Registered here rather
    // than in the widget because the page owns what "closed" restores: the ring
    // goes back to the field's box, not to wherever the shell would put it.
    _releaseBackClaim = _shell?.claimBack(_closeTvKeyboard);
  }

  /// Closes the keyboard and puts the remote back on the field's box.
  ///
  /// [moveToResults] is DOWN off the action row: the ring steps out of the
  /// band and into whatever is below it, which is the same walk
  /// [_leaveField] makes for BACK.
  void _closeTvKeyboard({bool moveToResults = false}) {
    if (!_tvKeyboardOpen) return;
    // Released before the frame that removes the keyboard: from here on the
    // next back press is the shell's again, and a claim left registered would
    // eat the press that returns to the bar.
    _releaseBackClaim?.call();
    _releaseBackClaim = null;
    setState(() => _tvKeyboardOpen = false);
    // After the frame that removes it: a node whose control has gone cannot be
    // asked for focus, and the box under it is only the neighbour once the
    // keyboard's own nodes are out of the traversal graph.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      if (_fieldNode.context == null || !_fieldNode.canRequestFocus) return;
      _fieldNode.requestFocus();
      if (moveToResults) {
        _fieldNode.focusInDirection(TraversalDirection.down);
      }
    });
  }

  /// The microphone, in both of the places it lives.
  ///
  /// One definition, two homes. On a pointer device it is the field's trailing
  /// suffix icon, which is where a mouse looks for it and where nothing beside it
  /// re-flows. On a television it is a control of the band's own row
  /// ([standalone]), because a suffix lives inside the field's subtree and a
  /// focused `EditableText` answers every arrow key itself - a remote cannot land
  /// in a suffix at all, which is the defect this change exists for.
  ///
  /// Either way it is a [FocusableCard] wearing [CardFocusRing] - the house
  /// treatment for anything a remote can land on, since a bare `IconButton` is
  /// pointer-only and would be the one focusable in the app without a ring - and
  /// either way it runs [_startVoiceSearch].
  ///
  /// **The band's copy needs the same focus boundary as the field's box**, and
  /// for the same reason: `SkipPageShellFocus` defuses a node that sits at the
  /// top of a page and has a focus descendant, and the microphone is one. Left
  /// alone it is made unfocusable a frame after anything focuses it - measured on
  /// the device: BACK moved the ring onto the microphone and the ring then jumped
  /// to the bar on its own, because the node it had landed on stopped accepting
  /// focus.
  Widget _buildMicrophone({bool standalone = false}) {
    final tokens = context.tokens;
    final Widget icon = Padding(
      padding: const EdgeInsets.all(ZplaySpacing.s8),
      child: Semantics(
        button: true,
        label: l10nOf(context).searchVoice,
        child: Icon(Icons.mic_rounded, size: 18, color: tokens.textSecondary),
      ),
    );
    final Widget card = FocusableCard(
      // Named for the band's copy only: [_leaveField] hands BACK's ring to it,
      // and a node nobody can name cannot be handed anything.
      focusNode: standalone ? _micFocusNode : null,
      onTap: _startVoiceSearch,
      builder: (context, state) => CardFocusRing(
        focused: state.focused,
        radius: ZplayRadius.fullAll,
        // The band's copy stands beside a 42 dp field, so it is held to that
        // height and to the 48 dp width floor a television control is held to
        // here; the suffix copy is sized by its own padding, as it always was.
        child: standalone
            ? SizedBox(width: 48, height: 42, child: Center(child: icon))
            : icon,
      ),
    );
    if (!standalone) return card;
    return Focus(canRequestFocus: false, skipTraversal: true, child: card);
  }

  /// Answers BACK and `escape` while the field holds focus: the way out of the
  /// one-way trap.
  ///
  /// **Why it hangs off the field's own node.** Key handling walks the focus
  /// chain from the primary node *upwards*, calling each node's `onKeyEvent`
  /// (`FocusManager._handleKeyMessage`), so the field's own node is the only
  /// place that runs before `Shortcuts` can turn a press into an `Intent`. That
  /// matters for exactly one of these two keys. The remote's BACK arrives as
  /// `goBack`, which nothing claims; a keyboard's escape arrives as `escape`,
  /// which `WidgetsApp` binds to [DismissIntent] - and a focused `EditableText`
  /// installs `DismissIntent: CallbackAction(_hideToolbarIfVisible)` in its own
  /// `Actions` map (`editable_text.dart`). `Actions.maybeFind` walks up from the
  /// primary focus, so that entry is found before anything this page could
  /// mount, it is enabled whether or not a toolbar is showing, and
  /// `Action.consumesKey` answers true: the press is eaten by a field with
  /// nothing to dismiss, and no ancestor `Actions` or `Focus` handler ever sees
  /// it. A handler on the field's own node is not above that mechanism - it is
  /// *before* it.
  ///
  /// **It stands down for everything else.** Only these two keys are looked at,
  /// and only on a remote-driven device: characters, the arrows, Tab and the
  /// centre button are all returned [KeyEventResult.ignored], untouched, so
  /// nothing here competes with the platform IME. The handler is also only ever
  /// called while the field is in the focus path, which is the condition
  /// `home_page.dart`'s page-level handler tests for with `is EditableText` -
  /// here it is true by construction instead of checked.
  KeyEventResult _onFieldKeyEvent(FocusNode node, KeyEvent event) {
    if (!FormFactorService.hasRemoteInput) return KeyEventResult.ignored;
    if (event.logicalKey != LogicalKeyboardKey.escape &&
        event.logicalKey != LogicalKeyboardKey.goBack) {
      return KeyEventResult.ignored;
    }
    // **Both halves of the press**, and the key-up is not a formality. The
    // platform keyboard on a television takes the key-*down* for itself while it
    // is showing - measured on the emulator: with the IME up no key event reaches
    // Flutter at all and the keyboard simply closes - so the up is the first
    // thing this page hears about the press. And an unhandled up is re-dispatched
    // to Android, where a BACK the shell sees is a BACK that leaves Search rather
    // than stepping out of the field.
    _leaveField();
    return KeyEventResult.handled;
  }

  /// Closes the platform keyboard and moves the remote off the field.
  ///
  /// Both halves are needed, and neither implies the other. The keyboard belongs
  /// to the platform, so hiding it is a platform call - `TextInput.hide` is the
  /// one text-input method documented as valid at any time
  /// (`SystemChannels.textInput`) - while the trap is a focus trap, so the field
  /// also has to stop being the focused thing, or the user is back inside it the
  /// moment the keyboard returns.
  void _leaveField() {
    SystemChannels.textInput.invokeMethod<void>('TextInput.hide');
    // The band's own row first: the microphone is the control beside the field,
    // and landing there keeps the remote on the page's own row. Asked for rather
    // than assumed: a node that cannot take focus would swallow the request and
    // leave the ring where it was, which reads as "BACK did nothing".
    if (_micFocusNode.context != null && _micFocusNode.canRequestFocus) {
      _micFocusNode.requestFocus();
      return;
    }
    // No recognizer, so the band has nothing to hand the ring to: it goes to the
    // first control *below* the band - the results, the recent searches or the
    // suggested rails, whichever this page is showing - by asking the traversal
    // policy the same question an arrow key asks.
    if (!_focusNode.focusInDirection(TraversalDirection.down)) {
      // Nothing below either - a page with no results, no history and no
      // suggestions yet. The ring then goes back the way the remote came in
      // (the shell's bar row) rather than nowhere at all: an escape that leaves
      // no marker anywhere is indistinguishable from a key that did nothing.
      _focusNode.unfocus(
        disposition: UnfocusDisposition.previouslyFocusedChild,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final topPadding = MediaQuery.of(context).padding.top;
    final tokens = context.tokens;
    // 统一读取设备形态，避免重复查询并据此决定顶部搜索栏的归属。
    final formFactor = FormFactorService.of(context);
    final isTelevision = formFactor == FormFactor.television;
    // 宽屏桌面壳层已有全局顶部搜索框时，隐藏搜索页内重复的输入框。
    final hasShellHeaderSearch =
        _shell != null &&
        formFactor != FormFactor.compact &&
        formFactor != FormFactor.television &&
        MediaQuery.sizeOf(context).width >= 1100;

    // The bar's row handle is re-stated after every frame, for the same reason
    // `HomePage` re-states its own: the handle is one field and a page that
    // rebuilds does not mean to give it up. After the frame and not during it,
    // because the answer is read off the built box - a node whose control has
    // gone away has no context, and publishing it would hand the shell a node it
    // cannot ask for a rect.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _publishChromeEntry();
    });

    return Scaffold(
      backgroundColor: tokens.bg,
      extendBodyBehindAppBar: true,
      appBar: hasShellHeaderSearch
          ? null
          : PreferredSize(
              preferredSize: const Size.fromHeight(kToolbarHeight + 10),
              // The band is **transparent at rest and tinted once results scroll
              // under it** - no opaque `tokens.bg` fill and no bottom hairline.
              //
              // An opaque band pinned above the content is the "different app" seam:
              // the shell's nav bar blends into whatever the page paints beneath it,
              // and a page that draws its own surface across the top re-creates the
              // boundary the bar just stopped drawing. The field itself is a
              // `tokens.surface` box, so it stays legible over the canvas; the tint
              // exists for the gutter beside it, where a scrolling rail would
              // otherwise slide past the field's edge.
              //
              // `Material`'s `AppBar` is deliberately not used here. It is a
              // `Focus`-hosting widget whose toolbar is excluded from directional
              // traversal, so a `TextField` placed in `appBar` is never a candidate for
              // a D-pad press: the field renders, the user can see it, and a remote
              // cannot reach it. Verified on a Chromecast with Google TV - the focus
              // tree listed 21 focusables and the field was not one of them, so
              // neither `right` nor the centre button could put a cursor in it and a
              // television user could not search at all. `PreferredSize` is a plain
              // layout contract and imposes nothing on focus.
              child: ValueListenableBuilder<double>(
                valueListenable: _bandTint,
                // Fades the fill in behind the field over the first
                // [_bandBlendThreshold] of scroll and leaves the field itself alone:
                // it is the `child`, built once, so no scroll pixel rebuilds it.
                builder: (context, tint, child) => DecoratedBox(
                  decoration: BoxDecoration(
                    color: tokens.bg.withValues(alpha: 0.82 * tint),
                  ),
                  child: child,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    top: topPadding,
                    bottom: ZplaySpacing.s8,
                  ),
                  child: Row(
                    children: [
                      const SizedBox(width: ZplaySpacing.s8),
                      // Search is a shell slot, so it usually has nothing to pop back to
                      // and popping would dismiss the shell itself. Keeping the gate means a
                      // pushed SearchPage still shows the button and neither state shifts
                      // the field, since the inset above is unconditional.
                      if (Navigator.of(context).canPop())
                        KiruIconButton(
                          icon: const Icon(
                            Icons.arrow_back_ios_rounded,
                            size: 20,
                          ),
                          color: tokens.textPrimary,
                          onPressed: () => Navigator.pop(context),
                        ),
                      Expanded(
                        // The prototype caps the field at 540 dp rather than letting it
                        // run the full width of the canvas: a search box that wide on a
                        // 960 dp television reads as a banner, and the caret ends up a
                        // screen away from the icon it belongs to.
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 540),
                            child: _fieldBox(
                              isTelevision: isTelevision,
                              child: Container(
                                width: double.infinity,
                                height: 42,
                                decoration: BoxDecoration(
                                  color: tokens.surface,
                                  borderRadius: ZplayRadius.smAll,
                                  border: Border.fromBorderSide(
                                    tokens.hairline,
                                  ),
                                ),
                                child: KiruFormField(
                                  controller: _searchController,
                                  focusNode: _focusNode,
                                  // Never on a television.
                                  //
                                  // A focused text field installs
                                  // `DirectionalFocusAction.forTextField()` (editable_text.dart),
                                  // which deliberately ignores arrow intents and keeps them
                                  // for caret movement inside the field. So a field that takes
                                  // focus on arrival is a trap: the remote can type, but every
                                  // arrow press is consumed moving a caret through empty text
                                  // and focus never leaves, so the whole catalogue behind the
                                  // field is unreachable without a pointer. Verified on a
                                  // Chromecast with Google TV - down and up did nothing at all.
                                  //
                                  // On a pointer device autofocus is the expected behaviour,
                                  // and it is kept there. The rail's own autofocus means the
                                  // remote still starts on a visible, ringed row of the bar,
                                  // and on a television the field is typed into through the
                                  // card [_fieldBox] puts around this box, which routes the
                                  // remote's presses to `TvOnScreenKeyboard` rather than to
                                  // the caret here.
                                  autofocus: !isTelevision,
                                  // No IME suggestion strip and no autocorrect, on a
                                  // television.
                                  //
                                  // The keyboard the remote drives is the app's own
                                  // ([TvOnScreenKeyboard]), but the field is still a
                                  // real text field: a voice remote's text path, a
                                  // paired keyboard, or any platform route that raises
                                  // the IME raises it for *this* field. When it does,
                                  // the platform's strip appears above the key grid as
                                  // soon as the field has text and re-flows it under
                                  // the D-pad - measured on a Chromecast with Google
                                  // TV, where one keystroke moved every key down and
                                  // the press after it landed on its neighbour.
                                  //
                                  // Flutter turns `enableSuggestions: false` into
                                  // `TYPE_TEXT_FLAG_NO_SUGGESTIONS` plus the visible
                                  // password variation on Android
                                  // (`TextInputPlugin.inputTypeFromTextInputType`), and
                                  // the engine sets both because some devices ignore the
                                  // first flag alone. It is the app's only lever on an
                                  // IME it does not own, and the strip has nothing to
                                  // offer this field: the field takes a film title, and
                                  // the strip predicts English prose.
                                  //
                                  // A pointer device keeps both, which is what a text
                                  // field on a desktop or a phone is expected to do and
                                  // is not what moves a television's keys.
                                  enableSuggestions: !isTelevision,
                                  autocorrect: !isTelevision,
                                  style: ZplayType.subtitle.toStyle(
                                    color: tokens.textPrimary,
                                  ),
                                  textInputAction: TextInputAction.search,
                                  onChanged: _onSearchChanged,
                                  onSubmitted: _performSearch,
                                  decoration: InputDecoration(
                                    // "or paste links" is advice for a keyboard. A
                                    // television has no clipboard on the remote, so it
                                    // names an action the viewer cannot take.
                                    hintText: DeviceProfile.isTelevision
                                        ? l10nOf(context).searchHintTv
                                        : l10nOf(context).searchHint,
                                    hintStyle: ZplayType.body.toStyle(
                                      color: tokens.textDisabled,
                                    ),
                                    border: InputBorder.none,
                                    prefixIcon: Icon(
                                      Icons.search_rounded,
                                      size: 19,
                                      color: tokens.textMuted,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: ZplaySpacing.s12,
                                      vertical: ZplaySpacing.s12,
                                    ),
                                    suffixIcon: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        // Voice search, and always, not inside the
                                        // text-present branch below: on a pointer device
                                        // the field is usually empty when the user
                                        // arrives, so a microphone that waited for text
                                        // would be a control nobody could ever press -
                                        // which is the whole reason it is here.
                                        //
                                        // **Pointer devices only.** A suffix lives inside
                                        // the field's subtree, where a remote can never
                                        // land; on a television the same control is the
                                        // band's own, out in the row beside the field.
                                        // [_buildMicrophone] is the one definition of
                                        // it, in both homes.
                                        if (_voiceAvailable && !isTelevision)
                                          _buildMicrophone(),
                                        if (_searchController.text.isNotEmpty)
                                          KiruIconButton(
                                            icon: const Icon(
                                              Icons.close_rounded,
                                              size: 18,
                                            ),
                                            color: tokens.textSecondary,
                                            splashRadius: 18,
                                            onPressed: () {
                                              _searchController.clear();
                                              _onSearchChanged('');
                                            },
                                          )
                                        else ...[
                                          ValueListenableBuilder<bool>(
                                            valueListenable:
                                                HomePageSettings.enableAiQuiz,
                                            builder: (context, aiQuizEnabled, _) {
                                              if (!aiQuizEnabled) {
                                                return const SizedBox.shrink();
                                              }
                                              return KiruIconButton(
                                                icon: Icon(
                                                  Icons.auto_awesome_rounded,
                                                  size: 17,
                                                  color: AppThemeService
                                                      .currentPalette
                                                      .value
                                                      .primaryColor,
                                                ),
                                                tooltip: l10nOf(
                                                  context,
                                                ).searchAiQuiz,
                                                splashRadius: 18,
                                                onPressed: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (_) =>
                                                          const WeWatchQuizPage(),
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          ),
                                          KiruIconButton(
                                            icon: const Icon(
                                              Icons.content_paste_rounded,
                                              size: 17,
                                            ),
                                            tooltip: l10nOf(
                                              context,
                                            ).searchPaste,
                                            color: tokens.textSecondary,
                                            splashRadius: 18,
                                            onPressed: _pasteFromClipboard,
                                          ),
                                        ],
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      // **The microphone, on a television, as the band's own control.**
                      //
                      // Inside the suffix - where it is on a pointer device, and where
                      // [_buildMicrophone] still puts it there - a remote can never
                      // reach it: the suffix is in the field's subtree, and the field
                      // answers every arrow key itself, so a microphone behind the
                      // field is a microphone only a user who is already stuck in the
                      // field could press.
                      //
                      // Out here it is an ordinary control of the band, standing beside
                      // the box that owns it: RIGHT from the field's card reaches it,
                      // BACK out of the field lands on it ([_leaveField]), and its ring
                      // is the same [CardFocusRing] as every other control on screen.
                      if (isTelevision && _voiceAvailable) ...[
                        _buildMicrophone(standalone: true),
                        const SizedBox(width: ZplaySpacing.s8),
                      ],
                    ],
                  ),
                ),
              ),
            ),
      // The body sits on Home's canvas - the shared ambient background - instead
      // of a flat `tokens.bg` surface, and it feeds the band's tint from its own
      // scroll. The listener has to be here rather than in the band: the two are
      // different slots of this `Scaffold`, and the band cannot see a
      // notification raised by a scrollable it is not an ancestor of.
      body: NotificationListener<ScrollNotification>(
        onNotification: _onBodyScroll,
        child: AnimatedAmbientBackground(
          child: Stack(
            children: [
              if (_isMagnetMode && _magnetQuery.isNotEmpty)
                MagnetFilesView(
                  key: ValueKey(_magnetQuery),
                  magnet: _magnetQuery,
                )
              else
                KiruForuiTheme.ensure(
                  context,
                  (_) => _buildUnifiedResults(topPadding, hasShellHeaderSearch),
                ),

              // The remote's keyboard. Hung off the body rather than the band
              // because the band is a fixed-height `PreferredSize` slot: a
              // keyboard inside it would be clipped at the toolbar's height.
              // It sits left-aligned under the field it edits, capped to the
              // same 540 dp the field is, so a ten-foot user reads one column
              // - the query above and its keys below.
              if (isTelevision && _tvKeyboardOpen)
                Positioned(
                  top: topPadding + kToolbarHeight + 10 + ZplaySpacing.s8,
                  left: ZplaySpacing.s8,
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 540),
                    child: TvOnScreenKeyboard(
                      key: _tvKeyboardKey,
                      controller: _searchController,
                      onChanged: _onSearchChanged,
                      onSubmitted: _performSearch,
                      onClose: _closeTvKeyboard,
                      // UP off the top row is the same hand-off as BACK: close,
                      // then the ring lands back on the box the keyboard was
                      // opened from - which is what [_closeTvKeyboard] does
                      // after the frame.
                      onMoveUp: _closeTvKeyboard,
                      onMoveDown: () => _closeTvKeyboard(moveToResults: true),
                      // Inside the shell the press is claimed there, because
                      // `popRoute` reaches it whatever a key handler answers;
                      // without a shell (a route of its own) nothing else
                      // consumes it, so the key event is the only notice.
                      ownsBackKey: _shell == null,
                      onVoice: _voiceAvailable ? _startVoiceSearch : null,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  String _sortLabel(SearchSort sort) {
    final language = Localizations.localeOf(context).languageCode;
    return switch (sort) {
      SearchSort.relevance =>
        language == 'zh'
            ? '\u7efc\u5408'
            : language == 'ar'
            ? '\u0627\u0644\u0635\u0644\u0629'
            : 'Relevance',
      SearchSort.newest =>
        language == 'zh'
            ? '\u6700\u65b0'
            : language == 'ar'
            ? '\u0627\u0644\u0623\u062d\u062f\u062b'
            : 'Newest',
      SearchSort.rating =>
        language == 'zh'
            ? '\u8bc4\u5206'
            : language == 'ar'
            ? '\u0627\u0644\u062a\u0642\u064a\u064a\u0645'
            : 'Rating',
    };
  }

  void _openAnime(UnifiedSearchResult result) {
    Navigator.push(
      context,
      CinematicSlideRoute(
        page: result.arabic != null
            ? AnimeArabicDetailsPage(anime: result.arabic!)
            : AnimeDetailsPage(anime: result.anime!),
      ),
    );
  }

  Widget _buildUnifiedResults(double topPadding, bool shellField) {
    final tokens = context.tokens;
    final l10n = l10nOf(context);
    final visible = _visibleResults;
    final start = topPadding + (shellField ? 8 : kToolbarHeight + 16);
    final gutter = MediaQuery.sizeOf(context).width >= 1100 ? 48.0 : 16.0;
    final labels = {
      SearchCategory.all: l10n.uiMyListPageAll,
      SearchCategory.movie: l10n.mediaTypeMovie,
      SearchCategory.series: l10n.mediaTypeSeries,
      SearchCategory.anime: l10n.mediaTypeAnime,
      SearchCategory.variety: varietyLabel(context),
    };
    return Padding(
      padding: EdgeInsets.only(top: start),
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: gutter),
            child: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: SegmentedTabs<SearchCategory>(
                      key: const ValueKey('kiru-search-categories'),
                      options: [
                        for (final category in SearchCategory.values)
                          SegmentedTabOption(
                            value: category,
                            label: labels[category]!,
                          ),
                      ],
                      selected: _category,
                      onSelected: _selectCategory,
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                KiruPopupMenu<SearchSort>(
                  key: const ValueKey('kiru-search-sort'),
                  initialValue: _sort,
                  tooltip: l10n.uiAnimeSearchPageSortBy,
                  itemBuilder: (_) => [
                    for (final sort in SearchSort.values)
                      PopupMenuItem(value: sort, child: Text(_sortLabel(sort))),
                  ],
                  onSelected: (sort) {
                    setState(() => _sort = sort);
                    if (_category == SearchCategory.anime &&
                        _lastQuery.isEmpty) {
                      _runAnimeFilters('');
                    }
                    if (_isFilmCategory && _lastQuery.isEmpty) _runFilmBrowse();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          _sortLabel(_sort),
                          style: ZplayType.subtitle.toStyle(
                            color: tokens.textPrimary,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Icon(
                          Icons.keyboard_arrow_down_rounded,
                          size: 18,
                          color: tokens.textSecondary,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (_category == SearchCategory.anime)
            Padding(
              padding: EdgeInsets.fromLTRB(gutter, 8, gutter, 8),
              child: AnimeSearchFilterBar(
                key: const ValueKey('kiru-inline-anime-filters'),
                filters: _animeFilters,
                onChanged: _setAnimeFilters,
              ),
            ),
          if (_isFilmCategory)
            Padding(
              padding: EdgeInsets.fromLTRB(gutter, 8, gutter, 8),
              child: FilmSearchFilterBar(
                category: _category,
                filters: _filmFilters,
                onChanged: _setFilmFilters,
              ),
            ),
          if (_lastQuery.isNotEmpty || _usesAnimeFilters || _usesFilmBrowse)
            Padding(
              padding: EdgeInsets.fromLTRB(gutter, 8, gutter, 0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      _lastQuery.isNotEmpty ? _lastQuery : labels[_category]!,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: ZplayType.title.toStyle(color: tokens.textPrimary),
                    ),
                  ),
                  Text(
                    l10n.animeSearchResultCount(visible.length),
                    style: ZplayType.bodySmall.toStyle(
                      color: tokens.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          if (_isFilmCategory && _filmFilters.active)
            Padding(
              padding: EdgeInsets.fromLTRB(gutter, 0, gutter, 4),
              child: Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  Localizations.localeOf(context).languageCode == 'zh'
                      ? '\u4ec5\u663e\u793a\u5df2\u83b7\u53d6\u4e14\u7b26\u5408\u6761\u4ef6\u7684\u5f71\u89c6\uff0c\u7f3a\u5c11\u76f8\u5e94\u5143\u6570\u636e\u7684\u5185\u5bb9\u6682\u4e0d\u7eb3\u5165\u7b5b\u9009'
                      : 'Filters include available results with matching metadata.',
                  style: ZplayType.caption.toStyle(color: tokens.textMuted),
                ),
              ),
            ),
          if (_usesAnimeFilters
              ? _loadingFilteredAnime
              : _usesFilmBrowse
              ? (_loadingFilmBrowse || _isLoadingSuggestions)
              : (_isLoading || _enrichingFilm))
            const SizedBox(height: 2, child: KiruProgress()),
          if (!_usesAnimeFilters && _outcome == SearchOutcome.incomplete)
            _buildFailureLedger(0, includeHeaderInset: false),
          Expanded(
            child: _usesAnimeFilters && _filterError != null
                ? ErrorView(
                    title: l10n.searchFailureTitle,
                    error: l10n.searchFailureAdvice,
                    onRetry: () => _runAnimeFilters(_lastQuery),
                  )
                : _lastQuery.isEmpty && !_usesAnimeFilters && !_usesFilmBrowse
                ? _buildDiscoveryEmptyState(0, includeHeaderInset: false)
                : visible.isEmpty
                ? ((_usesAnimeFilters
                          ? _loadingFilteredAnime
                          : _usesFilmBrowse
                          ? (_loadingFilmBrowse || _isLoadingSuggestions)
                          : (_isLoading || _enrichingFilm))
                      ? const Center(child: KiruLoader())
                      : !_hasResults && !_usesAnimeFilters && !_usesFilmBrowse
                      ? _buildSearchEmptyState(_outcome)
                      : Center(
                          child: Text(
                            _lastQuery.isEmpty
                                ? (_isFilmCategory
                                      ? l10n.searchNoResults(labels[_category]!)
                                      : l10n.uiAnimeSearchPageNoAnimeFoundMatchingYour)
                                : l10n.searchNoResults(_lastQuery),
                            style: TextStyle(color: tokens.textSecondary),
                          ),
                        ))
                : LayoutBuilder(
                    builder: (context, bounds) {
                      final columns = ((bounds.maxWidth - gutter * 2) / 170)
                          .floor()
                          .clamp(2, 10);
                      final width =
                          (bounds.maxWidth - gutter * 2 - (columns - 1) * 16) /
                          columns;
                      return GridView.builder(
                        key: ValueKey(_category),
                        padding: EdgeInsets.fromLTRB(gutter, 16, gutter, 32),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: columns,
                          crossAxisSpacing: 16,
                          mainAxisSpacing: 20,
                          mainAxisExtent: width * 1.48 + 72,
                        ),
                        itemCount: visible.length,
                        itemBuilder: (context, index) {
                          final result = visible[index];
                          return KeyedSubtree(
                            key: ValueKey(result.identity),
                            child: result.movie != null
                                ? MovieCard(movie: result.movie!)
                                : AnimeCard(
                                    anime: result.anime!,
                                    width: width,
                                    onTap: () => _openAnime(result),
                                  ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  /// Puts the redacted diagnostic report on the clipboard from the all-sources
  /// failed screen.
  ///
  /// This is the surface where "no source answered" is indistinguishable from a
  /// broken addon list, an expired provider runtime or a network change, and
  /// the report is what tells those apart. It is local-only; nothing is sent.
  Future<void> _copyDiagnosticReport() async {
    try {
      final text = await DiagnosticsExport.instance.copyText();
      await Clipboard.setData(ClipboardData(text: text));
      if (!mounted) return;
      KiruToastMessenger.maybeOf(context)?.showSnackBar(
        KiruToast(content: Text(l10nOf(context).diagnosticsCopiedToClipboard)),
      );
    } catch (error) {
      debugPrint('[SearchPage] could not copy diagnostics: $error');
    }
  }

  /// The finished-but-empty result area. A dead source and a real miss are
  /// different answers, so they get different screens: only the genuine miss
  /// may claim the title does not exist.
  Widget _buildSearchEmptyState(SearchOutcome outcome) {
    final tokens = context.tokens;
    final l10n = l10nOf(context);

    switch (outcome) {
      case SearchOutcome.failed:
        final total = _ledger.searchedSourceCount;
        final errors = _ledger.sourceErrors;
        final failed = errors.length > total ? total : errors.length;
        final detail = errors.isEmpty ? '' : ': ${errors.join(', ')}';
        return ErrorView(
          title: l10n.searchFailureTitle,
          error:
              '${l10n.searchFailureBody(failed, total)}$detail. '
              '${l10n.searchFailureAdvice}',
          onRetry: () => _performSearch(_lastQuery),
          secondaryActionLabel: l10n.actionCopyDiagnostic,
          onSecondaryAction: _copyDiagnosticReport,
        );
      case SearchOutcome.noResults:
        return Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.search_off_rounded,
                size: 64,
                color: tokens.textDisabled,
              ),
              const SizedBox(height: ZplaySpacing.s16),
              Text(
                l10n.searchNoResults(_lastQuery),
                style: ZplayType.subtitle.toStyle(color: tokens.textSecondary),
              ),
            ],
          ),
        );
      case SearchOutcome.complete:
      case SearchOutcome.incomplete:
        // Unreachable: both need at least one result, and this widget is only
        // reached when _results is empty.
        return const SizedBox.shrink();
    }
  }

  /// The Failure Ledger: names the sources that died while the rest of the
  /// search carried on.
  ///
  /// A partial list presented as a complete one is its own lie, so the failed
  /// legs are named above the results instead of the results being taken away.
  /// The names are real: `AddonManager.searchAll` reports the addon's own name,
  /// `CloudStreamManager.searchExtensions` the extension's, and the title leg
  /// reports itself, so this can say *which* provider is down rather than "some
  /// sources".
  ///
  /// Two things it deliberately does not claim. A status code: the services
  /// hand back the thrown error and the ledger keeps only the leg name, so
  /// printing a `504` would be inventing a number the app never saw. And a
  /// "N of M providers" count: `searchedSourceCount` counts legs (title lookup,
  /// addons, CloudStream) while `sourceErrors` counts the addons and extensions
  /// inside those legs, so subtracting one from the other would produce a
  /// number that is simply wrong - two dead addons would read as two dead legs.
  Widget _buildFailureLedger(
    double topPadding, {
    bool includeHeaderInset = true,
  }) {
    final tokens = context.tokens;
    final l10n = l10nOf(context);
    final failed = _ledger.sourceErrors;

    return Padding(
      padding: EdgeInsets.only(
        top: includeHeaderInset
            ? topPadding + kToolbarHeight + ZplaySpacing.s8
            : 8,
        left: ZplaySpacing.s16,
        right: ZplaySpacing.s16,
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: ZplaySpacing.s12,
          vertical: ZplaySpacing.s8,
        ),
        decoration: BoxDecoration(
          color: tokens.danger.withValues(alpha: 0.12),
          borderRadius: ZplayRadius.smAll,
          border: Border.all(color: tokens.danger.withValues(alpha: 0.35)),
        ),
        child: Row(
          children: [
            Icon(Icons.error_outline_rounded, size: 16, color: tokens.danger),
            const SizedBox(width: ZplaySpacing.s8),
            Expanded(
              child: Text(
                l10n.searchPartialFailure(failed.join(l10n.listSeparator)),
                style: ZplayType.bodySmall.toStyle(color: tokens.danger),
              ),
            ),
            const SizedBox(width: ZplaySpacing.s12),
            FocusableCard(
              onTap: () => _performSearch(_lastQuery),
              builder: (context, state) => CardFocusRing(
                focused: state.focused,
                radius: ZplayRadius.xsAll,
                child: Container(
                  // A television has to be able to hit this with a D-pad, and
                  // the prototype's chip is 24 dp tall. The floor applies there
                  // only; on a pointer device the compact chip is the design.
                  constraints: BoxConstraints(
                    minHeight: DeviceProfile.isTelevision ? 48 : 0,
                    minWidth: 48,
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: ZplaySpacing.s8,
                    vertical: ZplaySpacing.s4,
                  ),
                  decoration: BoxDecoration(
                    color: tokens.danger.withValues(alpha: 0.2),
                    borderRadius: ZplayRadius.xsAll,
                  ),
                  child: Text(
                    l10n.actionRetry,
                    style: ZplayType.caption.toStyle(color: tokens.textPrimary),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDiscoveryEmptyState(
    double topPadding, {
    bool includeHeaderInset = true,
  }) {
    final tokens = context.tokens;
    final l10n = l10nOf(context);
    final suggestions = _category == SearchCategory.all
        ? _suggestedSections.take(4).toList()
        : [
            for (final section in _suggestedSections)
              MovieSection(
                title: section.title,
                subtitle: section.subtitle,
                contentType: section.contentType,
                addonBaseUrl: section.addonBaseUrl,
                catalog: section.catalog,
                movies: section.movies
                    .where(
                      (m) => UnifiedSearchResult.movie(m).category == _category,
                    )
                    .toList(),
              ),
          ].where((s) => s.movies.isNotEmpty).take(4).toList();

    final showAnime =
        _category == SearchCategory.all || _category == SearchCategory.anime;
    final hasAnime =
        showAnime && _animeDiscovery.any((items) => items.isNotEmpty);
    return ListView(
      clipBehavior: Clip.none,
      padding: EdgeInsets.only(
        top: includeHeaderInset
            ? topPadding + kToolbarHeight + ZplaySpacing.s12
            : ZplaySpacing.s12,
        bottom: ZplaySpacing.s40 + MediaQuery.paddingOf(context).bottom,
      ),
      physics: const BouncingScrollPhysics(),
      children: [
        // Recent Searches
        if (_searchHistory.isNotEmpty) ...[
          const SizedBox(height: ZplaySpacing.s8),
          SectionHeader(
            title: l10n.searchRecent,
            // The quiet page-level action the design contract asks for: a
            // ringed [FocusableCard], not a bare text button - it used to be a
            // focusable with no indicator at all, which a remote could reach
            // with nothing on screen saying where it was.
            trailing: FocusableCard(
              onTap: _clearSearchHistory,
              builder: (context, state) => CardFocusRing(
                focused: state.focused,
                radius: ZplayRadius.smAll,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: ZplaySpacing.s8,
                    vertical: ZplaySpacing.s8,
                  ),
                  child: Text(
                    l10n.searchClearAll,
                    style: ZplayType.label.toStyle(color: tokens.textSecondary),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: ZplaySpacing.s8),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: ZplaySpacing.s16),
            child: Wrap(
              spacing: ZplaySpacing.s8,
              runSpacing: ZplaySpacing.s8,
              children: _searchHistory
                  .map((query) => _buildHistoryChip(query, tokens))
                  .toList(),
            ),
          ),
          const SizedBox(height: ZplaySpacing.s12),
        ],

        // Discover / Trending Content
        if (suggestions.isNotEmpty) ...[
          const SizedBox(height: ZplaySpacing.s8),
          // One quiet section title rather than an eyebrow: the same
          // [SectionHeader] the rails under it use, so the group label and the
          // rail labels are one vocabulary instead of two.
          SectionHeader(title: l10n.searchTrending),
          const SizedBox(height: ZplaySpacing.s8),
          // Home's own rail list (`_loadSuggestions` calls
          // `fetchAllHomeSections`), so it draws in Home's shape - the same
          // shelf, one shape. See the results list above for the whole reason.
          ...suggestions.map(
            (sec) => MovieSliderSection(
              section: sec,
              artwork: CardArtwork.landscape,
              showSeeAll: _category == SearchCategory.all,
            ),
          ),
        ] else if (_isLoadingSuggestions &&
            _category != SearchCategory.anime) ...[
          const SizedBox(height: ZplaySpacing.s32),
          Center(
            child: KiruLoader(
              strokeWidth: 2,
              color: AppThemeService.currentPalette.value.primaryColor,
            ),
          ),
        ],

        if (showAnime) ...[
          for (var i = 0; i < _animeDiscovery.length; i++)
            if (_animeDiscovery[i].isNotEmpty)
              AnimeSliderSection(
                title: [
                  l10n.uiAnimeSearchPageTrendingAnime,
                  l10n.uiAnimeSearchPagePopularThisSeason,
                  l10n.uiAnimeSearchPageAllTimeTopRated,
                ][i],
                animeList: _animeDiscovery[i],
                onAnimeTap: (anime) =>
                    _openAnime(UnifiedSearchResult.anime(anime)),
              ),
          if (!_loadingAnimeDiscovery &&
              _animeDiscoveryRequested &&
              !hasAnime &&
              _category == SearchCategory.anime)
            Center(
              child: KiruButton(
                kind: KiruButtonKind.ghost,
                onPressed: () => _loadAnimeDiscovery(refresh: true),
                child: Text(l10n.actionRetry),
              ),
            ),
          if (_loadingAnimeDiscovery)
            const Padding(
              padding: EdgeInsets.all(24),
              child: Center(child: KiruLoader()),
            ),
        ],

        // A void. With no search history and no suggestions, this rendered as a
        // black rectangle with nothing in it, which on a television reads as a
        // broken screen rather than an empty one - and there is no keyboard
        // there to make the cause obvious.
        if (_searchHistory.isEmpty &&
            suggestions.isEmpty &&
            !hasAnime &&
            !(showAnime && _loadingAnimeDiscovery) &&
            (!_isLoadingSuggestions || _category == SearchCategory.anime)) ...[
          const SizedBox(height: ZplaySpacing.s48),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.search_rounded,
                  size: 44,
                  color: tokens.textDisabled,
                ),
                const SizedBox(height: ZplaySpacing.s16),
                Text(
                  l10n.searchNothingToSuggest,
                  style: ZplayType.subtitle.toStyle(
                    color: tokens.textSecondary,
                  ),
                ),
                const SizedBox(height: ZplaySpacing.s8),
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Text(
                    l10n.searchNothingToSuggestBody,
                    textAlign: TextAlign.center,
                    style: ZplayType.bodySmall.toStyle(color: tokens.textMuted),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  /// One recent search, as the app's quiet pill rather than a Material
  /// [InputChip].
  ///
  /// A chip is a control a remote has to be able to land on, so it is a
  /// [FocusableCard] wearing [CardFocusRing] like every other one, and it paints
  /// the Browse pill's resting rule - a borderless wash - so a row of them is
  /// not a row of boxes. `InputChip` also carried *two* actions on one focus
  /// node (run the query, delete the entry), which is why a remote could never
  /// delete a single entry: only the select action was reachable. The delete
  /// stays where it always effectively was - a pointer affordance beside the
  /// label - and `Clear All` above the row is the remote's way to empty it.
  Widget _buildHistoryChip(String query, ZplayTokens tokens) {
    return FocusableCard(
      onTap: () {
        _searchController.text = query;
        _performSearch(query);
      },
      builder: (context, state) => CardFocusRing(
        focused: state.focused,
        radius: ZplayRadius.fullAll,
        child: Container(
          padding: const EdgeInsets.fromLTRB(
            ZplaySpacing.s12,
            ZplaySpacing.s8,
            ZplaySpacing.s8,
            ZplaySpacing.s8,
          ),
          decoration: BoxDecoration(
            color: tokens.borderDefault,
            borderRadius: ZplayRadius.fullAll,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                query,
                style: ZplayType.label.toStyle(color: tokens.textEmphasis),
              ),
              const SizedBox(width: ZplaySpacing.s4),
              GestureDetector(
                onTap: () => _removeSearchHistory(query),
                child: Padding(
                  padding: const EdgeInsets.all(ZplaySpacing.s2),
                  child: Icon(
                    Icons.close_rounded,
                    size: 14,
                    color: tokens.textMuted,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
