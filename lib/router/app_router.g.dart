// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_router.dart';

// **************************************************************************
// GoRouterGenerator
// **************************************************************************

List<RouteBase> get $appRoutes => [$contentShellRoute];

RouteBase get $contentShellRoute => ShellRouteData.$route(
  navigatorKey: ContentShellRoute.$navigatorKey,
  factory: $ContentShellRouteExtension._fromState,
  routes: [
    GoRouteData.$route(
      path: '/list',
      factory: $ListRoute._fromState,
      routes: [
        GoRouteData.$route(path: ':id', factory: $DetailRoute._fromState),
      ],
    ),
  ],
);

extension $ContentShellRouteExtension on ContentShellRoute {
  static ContentShellRoute _fromState(GoRouterState state) =>
      const ContentShellRoute();
}

mixin $ListRoute on GoRouteData {
  static ListRoute _fromState(GoRouterState state) => const ListRoute();

  @override
  String get location => GoRouteData.$location('/list');

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

mixin $DetailRoute on GoRouteData {
  static DetailRoute _fromState(GoRouterState state) =>
      DetailRoute(id: state.pathParameters['id']!);

  DetailRoute get _self => this as DetailRoute;

  @override
  String get location =>
      GoRouteData.$location('/list/${Uri.encodeComponent(_self.id)}');

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
