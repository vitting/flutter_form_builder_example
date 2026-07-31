import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/sidebar/normal_sidebar.dart';
import 'package:flutter_form_builder_example/sidebar/resizable_sidebar.dart';

class SidebarOverlay extends StatelessWidget {
  final VoidCallback onClose;
  final bool canBeResized;
  final Widget? content;
  final bool showSidebar;
  final double width;
  final String? title;
  const SidebarOverlay({
    super.key,
    required this.onClose,
    this.content,
    this.canBeResized = false,
    this.showSidebar = false,
    this.width = 400,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 80,
      bottom: 0,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: width, end: 0),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        builder: (context, slideValue, child) {
          return Transform.translate(offset: Offset(slideValue, 0), child: child);
        },
        child: canBeResized
            ? ResizableSidebar(onSidebarHeaderCloseTap: onClose, content: content, initialSidebarWidth: width, title: title)
            : NormalSidebar(onHeaderCloseTap: onClose, content: content, sidebarWidth: width, title: title),
      ),
    );
  }
}
