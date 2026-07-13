import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/sidebar/background_overlay.dart';
import 'package:flutter_form_builder_example/sidebar/sidebar_controller.dart';
import 'package:flutter_form_builder_example/sidebar/sidebar_overlay.dart';

class Sidebar extends StatefulWidget {
  final Widget child;
  final SidebarController controller;
  const Sidebar({super.key, required this.child, required this.controller});

  @override
  State<Sidebar> createState() => _SidebarState();
}

class _SidebarState extends State<Sidebar> {
  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: widget.controller.sidebarOverlayController,
      overlayChildBuilder: (context) {
        return Stack(
          children: [
            if (widget.controller.showFullPageOverlay) BackgroundOverlay(onTap: () => widget.controller.close()),
            SidebarOverlay(
              onClose: () => widget.controller.close(),
              content: widget.controller.content,
              canBeResized: widget.controller.canBeResized,
            ),
          ],
        );
      },
      child: widget.child,
    );
  }
}
