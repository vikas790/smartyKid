import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:smartykids/data/di/new_locator.dart';
import 'package:smartykids/data/services/api/api_services.dart';
import 'package:smartykids/data/storage/storage_constants.dart';


class StorageService {
  final _box = Hive.box(box);

  bool hasData(String key) => _box.containsKey(key);

  String get getAuthToken {
    return _box.get(authTokenKey) ?? '';
  }

  set setAuthToken(String token) {
    _box.put(authTokenKey, token);
    debugPrint('Auth token ${token.isNotEmpty ? 'saved' : 'cleared'} in Hive');
    isUserLoggedIn = token.isNotEmpty;
    // Update ApiService using NewLocator
    _updateApiServiceAuthToken(token);
  }

  void _updateApiServiceAuthToken(String token) {
    try {
      final apiService = NewLocator.get<ApiService>();
      apiService.setAuthToken(token);
    } catch (e) {
      debugPrint('ApiService not available during auth token update: $e');
    }
  }

  void clearUserData() {
    debugPrint('Clearing stored user data & auth token from Hive');
    _box.delete(userDataKey);
    _box.delete(profileDataKey);
    setAuthToken = '';
    isUserLoggedIn = false;
  }

  void saveNotificationData(Map<String, dynamic>? notificationData) {
    _box.put(notificationDataKey, notificationData);
  }

  Map<dynamic, dynamic>? getNotificationData() {
    var data = _box.get(notificationDataKey);
    if (data != null) {
      return data;
    } else {
      return null;
    }
  }

  Future<int> clear() async => await _box.clear();

  Future<void> remove(String key) async => await _box.delete(key);

  bool get isFirstTimeUser => _box.get(isUserFirstTimeKey) ?? true;

  set setIsFirstTimeUser(bool value) {
    _box.put(isUserFirstTimeKey, value);
  }

  bool get isUserLoggedIn => _box.get(isUserLoggedInKey) ?? false;

  set isUserLoggedIn(bool value) {
    _box.put(isUserLoggedInKey, value);
  }

  String get getUserLat {
    return _box.get(userLatKey) ?? "";
  }

  void setUserLat(String latitude) {
    _box.put(userLatKey, latitude);
  }

  String get getUserLong {
    return _box.get(userLongKey) ?? "";
  }

  void setUserLong(String longitude) {
    _box.put(userLongKey, longitude);
  }

  void setProfileData(Map<String, dynamic> data) {
    _box.put(profileDataKey, data);
  }

  Map<String, dynamic>? getProfileData() {
    var data = _box.get(profileDataKey);
    if (data != null) {
      // Convert Map<dynamic, dynamic> to Map<String, dynamic>
      if (data is Map) {
        return data.map((key, value) => MapEntry(key.toString(), value));
      }
      return null;
    } else {
      return null;
    }
  }

  void saveClubListData(List<Map<String, dynamic>> clubListData) {
    _box.put(userClubListDataKey, clubListData);
  }

  List<Map<String, dynamic>>? getClubListData() {
    var data = _box.get(userClubListDataKey);
    if (data != null && data is List) {
      return data
          .map((item) => item is Map ? item.map((key, value) => MapEntry(key.toString(), value)) : null)
          .whereType<Map<String, dynamic>>()
          .toList();
    }
    return null;
  }


  Map<String, dynamic> _normalizeDynamicMap(Map<dynamic, dynamic> source) {
    return source.map((key, value) {
      if (value is Map) {
        return MapEntry(key.toString(), _normalizeDynamicMap(value));
      } else if (value is List) {
        return MapEntry(
          key.toString(),
          value.map((item) => item is Map ? _normalizeDynamicMap(item) : item).toList(),
        );
      }
      return MapEntry(key.toString(), value);
    });
  }
}