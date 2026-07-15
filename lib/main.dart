import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/router/app_router.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() {
  usePathUrlStrategy();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(routerConfig: appRouter);
  }
}
