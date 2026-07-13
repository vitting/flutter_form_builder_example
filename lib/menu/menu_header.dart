import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/menu/menu_expand_button.dart';

class MenuHeader extends StatelessWidget {
  final bool isExpanded;
  final bool showLabels;
  final bool showLabelSlot;
  final double fadeProgress;
  final VoidCallback onToggleMenu;
  const MenuHeader({
    super.key,
    required this.isExpanded,
    required this.showLabels,
    required this.showLabelSlot,
    required this.fadeProgress,
    required this.onToggleMenu,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: showLabels ? 8 : 0),
        child: Row(
          mainAxisAlignment: showLabels ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
          children: [
            if (showLabelSlot)
              Expanded(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 180),
                  curve: Curves.easeOut,
                  opacity: fadeProgress,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 4),
                    child: Text(
                      'Menu',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            MenuExpandButton(isExpanded: isExpanded, onToggleMenu: onToggleMenu),
          ],
        ),
      ),
    );
  }
}
