import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/menu/menu_header.dart';
import 'package:flutter_form_builder_example/menu/menu_item.dart';

class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool _isMenuExpanded = true;

  static const double _expandedWidth = 300;
  static const double _collapsedWidth = 60;

  List<Map<String, Object>> get _menuItems => const [
    {'icon': Icons.home_outlined, 'label': 'Home'},
    {'icon': Icons.list_alt_outlined, 'label': 'Items'},
    {'icon': Icons.settings_outlined, 'label': 'Settings'},
  ];

  void _toggleMenu() {
    setState(() {
      _isMenuExpanded = !_isMenuExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 280),
      curve: Curves.easeInOutCubic,
      width: _isMenuExpanded ? _expandedWidth : _collapsedWidth,
      clipBehavior: Clip.hardEdge,

      color: Colors.blue,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final bool showLabels = constraints.maxWidth >= 180;
          final bool showLabelSlot = constraints.maxWidth >= 120;
          // Convert width to fade progress: subtract 120 to start at 0, then divide by 90 so the next 90px maps to 0..1.
          final double fadeProgress = ((constraints.maxWidth - 120) / 90).clamp(0.0, 1.0);
          return SizedBox(
            height: double.infinity,
            child: Column(
              children: [
                MenuHeader(
                  isExpanded: _isMenuExpanded,
                  showLabels: showLabels,
                  showLabelSlot: showLabelSlot,
                  fadeProgress: fadeProgress,
                  onToggleMenu: _toggleMenu,
                ),
                ..._menuItems.map(
                  (item) =>
                      MenuItem(showLabels: showLabels, showLabelSlot: showLabelSlot, fadeProgress: fadeProgress, item: item),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
