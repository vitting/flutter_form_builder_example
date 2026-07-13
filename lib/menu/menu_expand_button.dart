import 'package:flutter/material.dart';

class MenuExpandButton extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggleMenu;
  const MenuExpandButton({super.key, required this.isExpanded, required this.onToggleMenu});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onToggleMenu,
      icon: Icon(isExpanded ? Icons.keyboard_double_arrow_left : Icons.keyboard_double_arrow_right, color: Colors.white),
      tooltip: isExpanded ? 'Minimize sidebar' : 'Expand sidebar',
    );
  }
}
