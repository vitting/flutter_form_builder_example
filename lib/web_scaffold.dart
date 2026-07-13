import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/menu/menu.dart';
import 'package:flutter_form_builder_example/sidebar/sidebar.dart';
import 'package:flutter_form_builder_example/sidebar/sidebar_controller.dart';
import 'package:flutter_form_builder_example/topbar.dart';

final sidebarController = SidebarController();

class WebScaffold extends StatelessWidget {
  final Widget content;
  const WebScaffold({super.key, required this.content});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Topbar(),
          Expanded(
            child: Row(
              children: [
                Menu(),
                Expanded(
                  child: Sidebar(
                    controller: sidebarController,
                    child: Column(children: [Expanded(child: content)]),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
