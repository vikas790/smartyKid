import 'package:get_it/get_it.dart';
import '../../routes/routes.dart';
import '../services/storage_service.dart';
import '../services/toast_service.dart';

final locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => StorageService());
  locator.registerLazySingleton(() => ToastService());
}
