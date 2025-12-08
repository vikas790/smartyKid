import 'package:smartykids/data/services/api/api_services.dart';
import 'package:smartykids/data/storage/storage.dart';
import 'package:smartykids/routing/navigation_services.dart';


final class NewLocator {
  static final _factories = <Type, Function>{};
  static final _singletons = <Type, Object?>{};
  static final _disposables = <Type, void Function(Object)>{};

  static void registerLazySingleton<T extends Object>(T Function() factory, {void Function(T)? dispose}) {
    if (!_factories.containsKey(T)) {
      _factories[T] = factory;
      _singletons[T] = null;
      if (dispose != null) {
        _disposables[T] = (instance) => dispose(instance as T);
      }
    } else {
      print('Warning: Factory for type $T already registered.');
    }
  }

  static void registerFactory<T extends Object>(T Function() factory) {
    if (!_factories.containsKey(T)) {
      _factories[T] = factory;
      _singletons.remove(T); // Ensure it's not treated as a singleton
    } else {
      print('Warning: Factory for type $T already registered.');
    }
  }

  static T get<T extends Object>() {
    if (_singletons.containsKey(T)) {
      if (_singletons[T] == null) {
        _singletons[T] = (_factories[T] as T Function()?)?.call();
        if (_singletons[T] == null) {
          throw Exception('Failed to create instance of type $T.');
        }
      }
      return _singletons[T] as T;
    } else if (_factories.containsKey(T)) {
      return (_factories[T] as T Function())(); // Create a new instance for factories
    } else {
      throw Exception('No factory registered for type $T.');
    }
  }

  static void dispose<T extends Object>() {
    if (_singletons.containsKey(T) && _singletons[T] != null && _disposables.containsKey(T)) {
      _disposables[T]!(_singletons[T]!);
      _singletons[T] = null; // Allow for potential re-creation
    }
  }

  static void registerDi() {
    // Register services in dependency order
    registerLazySingleton<StorageService>(() => StorageService());
    registerLazySingleton<ApiService>(() => ApiService());
    registerLazySingleton<NavigationService>(() => NavigationService());
  }

  static void reset() {
    _factories.clear();
    _singletons.clear();
    _disposables.clear();
  }

  // Private constructor to prevent instantiation of this final class
  const NewLocator._();
}

var appContext = NewLocator.get<NavigationService>().navigatorKey.currentContext!;