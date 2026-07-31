import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/sidebar/sidebar_header.dart';

class NormalSidebar extends StatelessWidget {
  final VoidCallback onHeaderCloseTap;
  final Widget? content;
  final double sidebarWidth;
  final String? title;
  const NormalSidebar({super.key, required this.onHeaderCloseTap, this.content, required this.sidebarWidth, this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: sidebarWidth,
      color: Colors.white,
      child: Column(
        children: [
          SidebarHeader(onClose: onHeaderCloseTap, title: title ?? 'Sidebar'),
          Expanded(child: SingleChildScrollView(child: content ?? SizedBox())),
        ],
      ),
    );
  }
}
