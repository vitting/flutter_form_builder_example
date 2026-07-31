import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class SidebarHeader extends StatelessWidget {
  final VoidCallback onClose;
  final String title;
  const SidebarHeader({super.key, required this.onClose, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(title, style: const TextStyle(color: Colors.white, fontSize: 18)),
          ),
          IconButton(
            onPressed: onClose,
            icon: const Icon(Symbols.close, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
