import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../view/splash_screen/splash_screen.dart';
import '../view/age_section/view/age_screen.dart';
import '../view/subject_section/view/subject_screen.dart';
import '../view/subject_section/view/english_screen.dart';
import '../view/subject_section/view/math_screen.dart';
import '../view/subject_section/view/science_screen.dart';
import '../core/di/locator.dart';

class Routes {
  static const String splashScreen = 'splashScreen';
  static const String ageScreen = 'ageScreen';
  static const String subjectScreen = 'subjectScreen';
  static const String englishScreen = 'englishScreen';
  static const String mathScreen = 'mathScreen';
  static const String scienceScreen = 'scienceScreen';
}

final GoRouter router = GoRouter(
  initialLocation: '/${Routes.splashScreen}',
  navigatorKey: NavigationService().navigatorKey,
  routes: [
    GoRoute(
      path: '/${Routes.splashScreen}',
      name: Routes.splashScreen,
      builder: (context, state) => SplashScreen(),
    ),
    GoRoute(
      path: '/${Routes.ageScreen}',
      name: Routes.ageScreen,
      builder: (context, state) => AgeScreen(),
    ),
    GoRoute(
      path: '/${Routes.subjectScreen}',
      name: Routes.subjectScreen,
      builder: (context, state) {
        final age = state.extra as int;
        return SubjectScreen(age: age);
      },
    ),
    GoRoute(
      path: '/${Routes.englishScreen}',
      name: Routes.englishScreen,
      builder: (context, state) => EnglishScreen(),
    ),
    GoRoute(
      path: '/${Routes.mathScreen}',
      name: Routes.mathScreen,
      builder: (context, state) => MathScreen(),
    ),
    GoRoute(
      path: '/${Routes.scienceScreen}',
      name: Routes.scienceScreen,
      builder: (context, state) => ScienceScreen(),
    ),
  ],
);

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();

  factory NavigationService() => _instance;

  NavigationService._internal();

  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  BuildContext? get appContext => navigatorKey.currentContext;

  void go(String routeName, {Map<String, String>? params, Object? extra}) {
    if (appContext != null) {
      GoRouter.of(appContext!).goNamed(routeName, pathParameters: params ?? {}, extra: extra);
    }
  }

  Future<T?> push<T>(String routeName, {Map<String, String>? params, Object? extra}) {
    if (appContext != null) {
      return GoRouter.of(appContext!).pushNamed<T>(routeName, pathParameters: params ?? {}, extra: extra);
    }
    return Future.value(null);
  }

  void replace(BuildContext context, String routeName, {Map<String, String>? params, Object? extra}) {
    GoRouter.of(context).replaceNamed(routeName, pathParameters: params ?? {}, extra: extra);
  }

  void pop([Object? result]) {
    navigatorKey.currentState?.pop(result);
  }
}
