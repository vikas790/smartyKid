import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:smartykids/data/di/new_locator.dart';
import 'package:smartykids/ui/core/localization/applocalization.dart';

import '../../storage/storage.dart';
import 'api_services.dart';

var userAuthToken = '';

mixin class ApiCaller {
  // final apiCaller = GetIt.I.get<ApiService>();
  // final storage = GetIt.I.get<StorageService>();
  late final apiCaller = NewLocator.get<ApiService>();
  final storage = NewLocator.get<StorageService>();

  Future execute(
      Future<Response> apiCall, {
        Function(dynamic errorRes)? onApiError,
        Function(int statusCode)? statusCode,
      }) async {
    try {
      //if (await _isInternetConnected()) {
      var res = (await apiCall);

      // Check for auth token in response headers
      // Try x-authorization-token first (as seen in API response), then auth_token as fallback
      String? token;
      if (res.headers["x-authorization-token"] != null) {
        token = res.headers["x-authorization-token"]![0].toString();
        debugPrint('Auth token found in x-authorization-token header: ${token.substring(0, token.length > 20 ? 20 : token.length)}...');
      } else if (res.headers["auth_token"] != null) {
        token = res.headers["auth_token"]![0].toString();
        debugPrint('Auth token found in auth_token header: ${token.substring(0, token.length > 20 ? 20 : token.length)}...');
      }

      if (token != null && token.isNotEmpty) {
        _manageAuthToken(token);
      } else {
        debugPrint('No auth token found in response headers. Available headers: ${res.headers.map.keys}');
      }

      statusCode?.call(res.statusCode ?? 0);
      return res.data;
      // } else {
      //   onApiError?.call(Strings.noInternetConnectionError());
      // }
    } catch (e) {
      if (e is DioException) {
        if ([400, 412, 404, 405, 409, 422, 403].contains(e.response?.statusCode)) {
          statusCode?.call(e.response?.statusCode ?? 0);
          return e.response?.data;
        } else if ([401].contains(e.response?.statusCode)) {
          if (storage.getAuthToken.isEmpty) {
            return e.response?.data;
          } else {
            // storage.clearUserData();
            // SocketManager().disconnect();
            // NewLocator.get<NavigationService>().pushAndRemoveUntil(Routes.loginScreen);
          }
        } else {
          if (e.type == DioExceptionType.connectionError) {
            onApiError?.call(Strings.noInternetConnectionError());
          } else if (e.type == DioExceptionType.connectionTimeout ||
              e.type == DioExceptionType.sendTimeout ||
              e.type == DioExceptionType.receiveTimeout) {
            onApiError?.call(Strings.requestTimeOutError());
          } else {
            onApiError?.call(Strings.somethingWentWrong());
          }
        }
      } else {
        onApiError?.call(Strings.somethingWentWrong());
      }
    }
  }

  void _manageAuthToken(String token) {
    debugPrint('Managing auth token: ${token.substring(0, token.length > 20 ? 20 : token.length)}...');
    userAuthToken = token;
    apiCaller.setAuthToken(token);
    storage.setAuthToken = token;
    debugPrint('Auth token saved to storage and ApiService');
  }

  Future<bool> _isInternetConnected() async {
    List<ConnectivityResult> connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult.contains(ConnectivityResult.mobile) ||
        connectivityResult.contains(ConnectivityResult.wifi) ||
        connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } else {
      if (connectivityResult.contains(ConnectivityResult.none)) {
        Future.delayed(const Duration(milliseconds: 100), () async {
          connectivityResult = await Connectivity().checkConnectivity();
          if (connectivityResult.contains(ConnectivityResult.none)) {
            return false;
          }
        });
      }
      return false;
    }
  }
}