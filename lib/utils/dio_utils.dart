import 'package:dio_cache_interceptor/dio_cache_interceptor.dart';

var store = DbCacheStore();
CacheOptions dioOptionsDefault = CacheOptions(
  store: store,
  policy: CachePolicy.cacheStoreForce,
  hitCacheOnErrorExcept: [401, 403],
  priority: CachePriority.high,
  maxStale: const Duration(days: 1),
);

CacheOptions dioOptionsRefresh = CacheOptions(
  store: store,
  policy: CachePolicy.refresh,
  hitCacheOnErrorExcept: [401, 403],
  priority: CachePriority.normal,
  maxStale: const Duration(days: 20),
);
