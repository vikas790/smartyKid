import 'package:get_it/get_it.dart';
import 'package:smartykids/data/services/api/api_services.dart';
import 'package:smartykids/data/services/local/toast_service.dart';
import 'package:smartykids/data/storage/storage.dart';
import 'package:smartykids/routing/navigation_services.dart';

abstract class Locator {
  static void registerDi() {
    final getIt = GetIt.instance;

    // Services
    getIt.registerLazySingleton<NavigationService>(() => NavigationService());
    getIt.registerLazySingleton<StorageService>(() => StorageService());
    getIt.registerLazySingleton<ToastService>(() => ToastService());
    getIt.registerLazySingleton<ApiService>(() => ApiService());
  }
}

var appContext = GetIt.I<NavigationService>().navigatorKey.currentContext!;