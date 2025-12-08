import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class HiveCachingInterceptor extends Interceptor {
  static final HiveCachingInterceptor _instance = HiveCachingInterceptor._internal();

  factory HiveCachingInterceptor() => _instance;

  HiveCachingInterceptor._internal();

  Duration _defaultTTL = const Duration(minutes: 1);

  Future<Box> _openBox() => Hive.openBox('cacheBox');

  /// Clears the entire cache manually
  Future<void> clearCache() async {
    final box = await _openBox();
    await box.clear();
    print("Hive cache cleared.");
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final useCache = options.extra['useCache'] == true;

    if (!useCache || options.method.toUpperCase() != 'GET') {
      return handler.next(options);
    }

    final box = await _openBox();
    final key = options.uri.toString();
    final raw = box.get(key);

    Map<String, dynamic>? cached;

    try {
      cached = raw != null ? deepCast(raw) : null;
    } catch (e) {
      print("Cache parsing failed: $e");
    }

    if (cached != null && DateTime.now().millisecondsSinceEpoch < cached['expires_at']) {
      print("Serving from Hive cache: $key");
      final cachedResponse = Response(requestOptions: options, data: cached['data'], statusCode: 200);
      return handler.resolve(cachedResponse);
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    final useCache = response.requestOptions.extra['useCache'] == true;

    if (useCache && response.requestOptions.method.toUpperCase() == 'GET') {
      final box = await _openBox();
      final key = response.requestOptions.uri.toString();

      final expiration = DateTime.now().add(_defaultTTL).millisecondsSinceEpoch;

      await box.put(key, {'data': response.data, 'expires_at': expiration});

      print("Stored in Hive cache: $key");
    }

    handler.next(response);
  }

  Map<String, dynamic> deepCast(dynamic input) {
    if (input is Map) {
      return input.map((key, value) => MapEntry(key.toString(), _castValue(value)));
    }
    throw ArgumentError('Expected a Map for deepCast');
  }

  dynamic _castValue(dynamic value) {
    if (value is Map) {
      return value.map((k, v) => MapEntry(k.toString(), _castValue(v)));
    } else if (value is List) {
      return value.map(_castValue).toList();
    } else {
      return value;
    }
  }
}