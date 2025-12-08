import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smartykids/data/di/new_locator.dart';
import 'package:smartykids/data/services/api/custom_log_interceptor.dart';
import 'package:smartykids/data/services/api/hive_caching_interceptor.dart';
import 'package:smartykids/data/storage/storage.dart';


class ApiService {
  late dio.Dio _dio;

  ApiService() {
    // _dio = dio.Dio(dio.BaseOptions(baseUrl: HostMode.environment.getBaseUrl));
    _dio = dio.Dio(dio.BaseOptions(baseUrl: 'https://la12.webdevprojects.cloud/la_the_skorekard/api/'));

    _dio.options.receiveDataWhenStatusError = true;
    _dio.options.sendTimeout = const Duration(milliseconds: 60000);
    _dio.options.connectTimeout = const Duration(milliseconds: 60000);
    _dio.options.receiveTimeout = const Duration(milliseconds: 60000);

    // Initialize auth token after DI is fully set up
    _initializeAuthToken();

    setDefaultHeaders();
    //_internetListener();
    //_dio.interceptors.add(internetCheckInterceptor);
    _dio.interceptors.add(HiveCachingInterceptor());
    // _dio.interceptors.add(LogarteDioInterceptor(logarte));
    _dio.interceptors.add(CustomLogInterceptor(requestBody: true, responseBody: true));
  }

  void _initializeAuthToken() {
    try {
      final storage = NewLocator.get<StorageService>();
      setAuthToken(storage.getAuthToken);
    } catch (e) {
      // If StorageService is not available yet, skip auth token initialization
      debugPrint('StorageService not available during ApiService initialization: $e');
    }
  }

  Future<dio.Response<T>> get<T>({required String url, Map<String, dynamic>? queryParams, bool isCompleteUrl = false, bool useCache = false}) async {
    final options = Options(extra: useCache ? {'useCache': true} : {});

    if (isCompleteUrl) {
      return _dio.getUri(Uri(path: url, queryParameters: queryParams), options: options);
    } else {
      return _dio.get(url, queryParameters: queryParams, options: options);
    }
  }

  Future<dio.Response<T>> multiPart<T>(
      {required String url, data, Map<String, dynamic>? queryParams, bool isCompleteUrl = false, required Function(int, int) progress}) =>
      isCompleteUrl
          ? _dio.postUri(Uri(path: url, queryParameters: queryParams),
          data: data, options: data is FormData ? dio.Options(contentType: dio.Headers.multipartFormDataContentType) : null)
          : _dio.post(url,
          queryParameters: queryParams,
          data: data,
          options: data is FormData ? dio.Options(contentType: dio.Headers.multipartFormDataContentType) : null, onSendProgress: (int sent, int total) {
            progress(sent, total);
            debugPrint("sent: $sent, total: $total");
          });

  Future<dio.Response<T>> post<T>({required String url, data, Map<String, dynamic>? queryParams, bool isCompleteUrl = false}) => isCompleteUrl
      ? _dio.postUri(Uri(path: url, queryParameters: queryParams),
      data: data, options: data is FormData ? dio.Options(contentType: dio.Headers.formUrlEncodedContentType) : null)
      : _dio.post(url, queryParameters: queryParams, data: data, options: data is FormData ? dio.Options(contentType: dio.Headers.formUrlEncodedContentType) : null);

  Future<dio.Response<T>> put<T>({required String url, data, Map<String, dynamic>? queryParams, bool isCompleteUrl = false}) => isCompleteUrl
      ? _dio.putUri(Uri(path: url, queryParameters: queryParams),
      data: data, options: data is FormData ? dio.Options(contentType: dio.Headers.formUrlEncodedContentType) : null)
      : _dio.put(url, queryParameters: queryParams, data: data, options: data is FormData ? dio.Options(contentType: dio.Headers.formUrlEncodedContentType) : null);

  Future<dio.Response<T>> delete<T>({required String url, data, Map<String, dynamic>? queryParams, bool isCompleteUrl = false}) =>
      isCompleteUrl ? _dio.deleteUri(Uri(path: url, queryParameters: queryParams), data: data) : _dio.delete(url, queryParameters: queryParams, data: data);

  Future<dio.Response<T>> patch<T>({required String url, data, Map<String, dynamic>? queryParams, bool isCompleteUrl = false}) =>
      isCompleteUrl ? _dio.patchUri(Uri(path: url, queryParameters: queryParams), data: data) : _dio.patch(url, queryParameters: queryParams, data: data);

  void setAuthToken(String token) {
    if (token.isNotEmpty) {
      // Remove existing Authorization header if present, then add new one
      _dio.options.headers.remove('Authorization');
      _dio.options.headers['Authorization'] = 'Bearer $token';
      debugPrint('Auth Token set in ApiService: Bearer ${token.substring(0, token.length > 20 ? 20 : token.length)}...');
    } else {
      // Remove Authorization header if token is empty
      _dio.options.headers.remove('Authorization');
      debugPrint('Auth Token removed from ApiService');
    }
  }

  void setDefaultHeaders() {
    // _dio.options.headers.addAll({"x-language": GetIt.I.get<StorageService>().getLanguage.name, "Accept": "application/json"});
    _dio.options.headers.addAll({"x-language": 'en', "Accept": "application/json"});
  }

  Future<void> _internetListener() async {
    Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> result) {
      debugPrint("ConnectivityResult ${result[0]}");
      if (result.contains(ConnectivityResult.mobile) || result.contains(ConnectivityResult.wifi) || result.contains(ConnectivityResult.ethernet)) {
        // if (NewLocator.get<NavigationService>().currentScreen == "networkIssueScreen") {
        //   NewLocator.get<NavigationService>().pop();
        // }
      } else if (result.contains(ConnectivityResult.none)) {
        Future.delayed(Duration(milliseconds: 100), () async {
          result = await Connectivity().checkConnectivity();
          // if (result.contains(ConnectivityResult.none)) {
          //   NewLocator.get<NavigationService>().push(Routes.networkIssueScreen);
          // }
        });
      }
    });
  }
}