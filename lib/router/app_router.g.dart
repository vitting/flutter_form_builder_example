// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$contentShellRoute];

RouteBase get $contentShellRoute => ShellRouteData.$route(
  navigatorKey: ContentShellRoute.$navigatorKey,
  factory: $ContentShellRouteExtension._fromState,
  routes: [GoRouteData.$route(path: '/', factory: $HomeRoute._fromState)],
);

extension $ContentShellRouteExtension on ContentShellRoute {
  static ContentShellRoute _fromState(GoRouterState state) =>
      const ContentShellRoute();
}

mixin $HomeRoute on GoRouteData {
  static HomeRoute _fromState(GoRouterState state) => const HomeRoute();

  @override
  String get location => GoRouteData.$location('/');

  @override
  void go(BuildContext context) => context.go(location);

  @override
  Future<T?> push<T>(BuildContext context) => context.push<T>(location);

  @override
  void pushReplacement(BuildContext context) =>
      context.pushReplacement(location);

  @override
  void replace(BuildContext context) => context.replace(location);
}
