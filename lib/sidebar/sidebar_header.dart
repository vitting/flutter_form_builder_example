import 'package:flutter/material.dart';

class SidebarHeader extends StatelessWidget {
  final VoidCallback onClose;
  const SidebarHeader({super.key, required this.onClose});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Sidebar'),
          IconButton(onPressed: onClose, icon: const Icon(Icons.close)),
        ],
      ),
    );
  }
}
