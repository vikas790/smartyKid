import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smartykids/ui/entry/select_subject_screen/view/select_subject_screen.dart';
import 'package:smartykids/ui/entry/splash_screen/view/splash_screen.dart';
import 'package:smartykids/ui/age_section/view/age_screen.dart';
import 'package:smartykids/ui/subject_section/english_subject/view/english_screen.dart';
import 'package:smartykids/ui/subject_section/math_subject/view/math_screen.dart';
import 'package:smartykids/ui/subject_section/science_subject/view/science_screen.dart';

class Routes {
  static const String splashScreen = 'splashScreen';
  static const String ageScreen = 'ageScreen';
  static const String subjectScreen = 'subjectScreen';
  static const String englishScreen = 'englishScreen';
  static const String mathScreen = 'mathScreen';
  static const String scienceScreen = 'scienceScreen';
}

String _getInitialLocation() {
  return '/${Routes.splashScreen}';
}

final GoRouter router = GoRouter(
  initialLocation: _getInitialLocation(),
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
        final age = state.extra as int? ?? 0;
        return SelectSubjectScreen(age: age);
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

  void go(String routeName, {Map<String, String>? params, Object? extra}) {
    if (navigatorKey.currentContext != null) {
        GoRouter.of(navigatorKey.currentContext!).goNamed(
        routeName,
        pathParameters: params ?? {},
        extra: extra,
        );
    }
  }

  Future<T?> push<T>(String routeName, {Map<String, String>? params, Object? extra}) {
    if (navigatorKey.currentContext != null) {
        return GoRouter.of(navigatorKey.currentContext!).pushNamed<T>(
        routeName,
        pathParameters: params ?? {},
        extra: extra,
        );
    }
    return Future.value(null);
  }

  void replace(BuildContext context, String routeName, {Map<String, String>? params, Object? extra}) {
    GoRouter.of(context).replaceNamed(
      routeName,
      pathParameters: params ?? {},
      extra: extra,
    );
  }

  void pop([Object? result]) {
    if (navigatorKey.currentContext != null) {
        GoRouter.of(navigatorKey.currentContext!).pop(result);
    }
  }
}