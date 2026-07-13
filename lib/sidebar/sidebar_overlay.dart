import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/sidebar/normal_sidebar.dart';
import 'package:flutter_form_builder_example/sidebar/resizable_sidebar.dart';

class SidebarOverlay extends StatelessWidget {
  final VoidCallback onClose;
  final bool canBeResized;
  final Widget? content;
  const SidebarOverlay({super.key, required this.onClose, this.content, this.canBeResized = false});

  final _sidebarWidth = 400.0;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      top: 80,
      bottom: 0,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: _sidebarWidth, end: 0),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        builder: (context, slideValue, child) {
          return Transform.translate(offset: Offset(slideValue, 0), child: child);
        },
        child: canBeResized
            ? ResizableSidebar(onSidebarHeaderCloseTap: onClose, content: content, initialSidebarWidth: _sidebarWidth)
            : NormalSidebar(onHeaderCloseTap: onClose, content: content, sidebarWidth: _sidebarWidth),
      ),
    );
  }
}
