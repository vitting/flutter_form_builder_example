import 'package:flutter/material.dart';

class DragContainer extends StatelessWidget {
  final Widget child;
  final bool isDragging;

  const DragContainer({super.key, required this.child, this.isDragging = false});

  @override
  Widget build(BuildContext context) {
    return Container(color: isDragging ? Colors.white.withAlpha(100) : Colors.transparent, width: 230, child: child);
  }
}
