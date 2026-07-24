import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_controller.dart';
import 'package:material_symbols_icons/symbols.dart';

class MetaSidebar extends StatelessWidget {
  final MetaSidebarController controller;
  const MetaSidebar({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: controller,
      builder: (context, child) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 280),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            border: Border(left: BorderSide(color: Colors.grey.shade700, width: 1)),
          ),
          width: controller.isOpen ? 500 : 0,
          height: double.infinity,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final bool showContent = constraints.maxWidth >= 200;
              if (!showContent) {
                return SizedBox.shrink();
              }
              return Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text('Meta information', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                      ),
                      IconButton(
                        icon: Icon(Symbols.close),
                        onPressed: () {
                          controller.close();
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: SingleChildScrollView(child: Column(children: [if (controller.content != null) controller.content!])),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
