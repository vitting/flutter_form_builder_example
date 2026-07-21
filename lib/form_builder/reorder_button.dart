import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class ReorderButton extends StatefulWidget {
  final VoidCallback? onPressed;
  const ReorderButton({super.key, this.onPressed});

  @override
  State<ReorderButton> createState() => _ReorderButtonState();
}

class _ReorderButtonState extends State<ReorderButton> {
  bool isReorderMode = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      isSelected: isReorderMode,
      selectedIcon: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(Symbols.lists, color: Colors.white),
      ),
      onPressed: () {
        setState(() {
          isReorderMode = !isReorderMode;
          widget.onPressed?.call();
        });
      },
      icon: CircleAvatar(child: Icon(Symbols.lists)),
    );
  }
}
