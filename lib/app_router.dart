import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/detail_page.dart';
import 'package:flutter_form_builder_example/list_page.dart';
import 'package:flutter_form_builder_example/web_scaffold.dart';
import 'package:go_router/go_router.dart';

part 'app_router.g.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final GlobalKey<NavigatorState> shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');
final GoRouter appRouter = GoRouter(navigatorKey: rootNavigatorKey, initialLocation: '/list', routes: $appRoutes);

@TypedShellRoute<ContentShellRoute>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<ListRoute>(
      path: '/list',
      routes: [TypedGoRoute<DetailRoute>(path: ':id')],
    ),
  ],
)
class ContentShellRoute extends ShellRouteData {
  static final GlobalKey<NavigatorState> $navigatorKey = shellNavigatorKey;
  const ContentShellRoute();

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return WebScaffold(content: navigator);
  }
}

class ListRoute extends GoRouteData with $ListRoute {
  const ListRoute();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage<void>(child: ListPage());
  }
}

class DetailRoute extends GoRouteData with $DetailRoute {
  final String id;
  const DetailRoute({required this.id});

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return NoTransitionPage<void>(child: DetailPage(id: id));
  }
}
