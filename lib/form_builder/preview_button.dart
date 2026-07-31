import 'package:flutter/material.dart';
import 'package:material_symbols_icons/symbols.dart';

class PreviewButton extends StatelessWidget {
  final VoidCallback? onPressed;
  const PreviewButton({super.key, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      selectedIcon: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Icon(Symbols.preview, color: Colors.white),
      ),
      onPressed: onPressed,
      icon: CircleAvatar(child: Icon(Symbols.preview)),
    );
  }
}
