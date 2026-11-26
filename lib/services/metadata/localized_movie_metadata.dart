import 'dart:async';
import 'dart:collection';

import '../../models/movie/movie.dart';
import '../../models/movie/movie_detail.dart';
import 'tmdb_service.dart';

/// Display-only translations; preserve source titles and media identity.
typedef LocalizedMovieText = ({String? title, String? overview});

abstract final class LocalizedMovieMetadata {
  static const _ttl = Duration(hours: 6);
  static const _maxEntries = 300;
  static final _cache = <String, ({LocalizedMovieText text, DateTime at})>{};
  static final _pending = <String, Future<LocalizedMovieText?>>{};
  static int _credentialGeneration = 0;
  static String? _credentialSnapshot;

  static void _syncCredential() {
    final current = TmdbService.apiKey.value;
    if (_credentialSnapshot != current) {
      _credentialSnapshot = current;
      clear();
    }
  }

  static const _catalogConcurrency = 4;
  static const _catalogQueueLimit = 48;
  static int _catalogActive = 0;
  static final _catalogWaiters = Queue<Completer<void>>();

  /// Catalog cards share the same identity cache as details. Bound background
  /// catalog lookups separately so detail navigation is not delayed by a rail.
  static Future<LocalizedMovieText?> lookupCatalog(
    Movie movie,
    String locale, {
    bool Function()? isCurrent,
  }) async {
    _syncCredential();
    if (!locale.startsWith('zh') ||
        !TmdbService.isConfigured ||
        movie.isCollection ||
        !RegExp(r'^tt[0-9]+$').hasMatch(movie.id) ||
        !const {'movie', 'series', 'tv'}.contains(movie.type)) {
      return null;
    }
    final type = movie.type == 'movie' ? 'movie' : 'tv';
    final cached = _cache['$type:zh-CN:${movie.id}'];
    if (cached != null && DateTime.now().difference(cached.at) < _ttl) {
      return cached.text;
    }
    final generation = _credentialGeneration;
    if (_catalogActive >= _catalogConcurrency) {
      if (_catalogWaiters.length >= _catalogQueueLimit) {
        return null;
      }
      final slot = Completer<void>();
      _catalogWaiters.add(slot);
      await slot.future;
    } else {
      _catalogActive++;
    }
    try {
      _syncCredential();
      if (generation != _credentialGeneration || !(isCurrent?.call() ?? true)) {
        return null;
      }
      return await lookup(
        MovieDetail(id: movie.id, type: movie.type, name: movie.name),
        locale,
      );
    } finally {
      if (_catalogWaiters.isNotEmpty) {
        _catalogWaiters.removeFirst().complete();
      } else {
        _catalogActive--;
      }
    }
  }

  static void clear() {
    _credentialGeneration++;
    _cache.clear();
    _pending.clear();
  }

  static Future<LocalizedMovieText?> lookup(
    MovieDetail detail,
    String locale,
  ) async {
    _syncCredential();
    if (locale.split(RegExp('[-_]')).first != 'zh' ||
        !TmdbService.isConfigured ||
        detail.isCollection) {
      return null;
    }
    final type = switch (detail.type) {
      'movie' => 'movie',
      'series' || 'tv' => 'tv',
      _ => null,
    };
    if (type == null) return null;
    final tmdbId = int.tryParse(detail.tmdbId ?? '');
    final imdbId = RegExp(r'^tt[0-9]+$').hasMatch(detail.id) ? detail.id : null;
    if ((tmdbId == null || tmdbId <= 0) && imdbId == null) return null;
    const language = 'zh-CN';
    final key = '$type:$language:${imdbId ?? tmdbId}';
    final cached = _cache[key];
    if (cached != null && DateTime.now().difference(cached.at) < _ttl) {
      return cached.text;
    }
    final generation = _credentialGeneration;
    final pending = _pending[key];
    if (pending != null) {
      final result = await pending;
      _syncCredential();
      return generation == _credentialGeneration ? result : null;
    }
    final future = _load(type, language, tmdbId, imdbId);
    _pending[key] = future;
    try {
      final text = await future;
      _syncCredential();
      if (generation != _credentialGeneration) return null;
      if (text != null) {
        if (_cache.length >= _maxEntries) _cache.remove(_cache.keys.first);
        _cache[key] = (text: text, at: DateTime.now());
      }
      return text;
    } finally {
      if (identical(_pending[key], future)) _pending.remove(key);
    }
  }

  static Future<LocalizedMovieText?> _load(
    String type,
    String language,
    int? tmdbId,
    String? imdbId,
  ) async {
    try {
      Map? data;
      if (tmdbId != null && tmdbId > 0) {
        data = await TmdbService.getJson('/$type/$tmdbId', {
          'language': language,
        });
      } else if (imdbId != null) {
        final found = await TmdbService.getJson('/find/$imdbId', {
          'external_source': 'imdb_id',
          'language': language,
        });
        final results =
            found?[type == 'movie' ? 'movie_results' : 'tv_results'];
        if (results is List && results.isNotEmpty && results.first is Map) {
          data = results.first as Map;
        }
      }
      if (data == null) return null;
      final title = _nonEmpty(data[type == 'movie' ? 'title' : 'name']);
      final overview = _nonEmpty(data['overview']);
      // TMDb may fall back to a foreign title or return an empty overview.
      final translatedTitle = _hasHan(title) ? title : null;
      final translatedOverview = _hasHan(overview) ? overview : null;
      if (translatedTitle == null && translatedOverview == null) return null;
      return (title: translatedTitle, overview: translatedOverview);
    } catch (_) {
      return null;
    }
  }

  static String? _nonEmpty(Object? value) {
    final text = value is String ? value.trim() : '';
    return text.isEmpty ? null : text;
  }

  static bool _hasHan(String? value) =>
      value != null && RegExp(r'[\u3400-\u9fff]').hasMatch(value);
}
