import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/home_page.dart';
import 'package:flutter_form_builder_example/web_scaffold.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final GoRouter appRouter = GoRouter(navigatorKey: rootNavigatorKey, initialLocation: '/', routes: $appRoutes);

@TypedShellRoute<ContentShellRoute>(routes: <TypedRoute<RouteData>>[TypedGoRoute<HomeRoute>(path: '/')])
class ContentShellRoute extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;
  const ContentShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return WebScaffold(content: navigator);
  }
}

class HomeRoute extends GoRouteData with $HomeRoute {
  const HomeRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage<void>(child: HomePage());
  }
}
