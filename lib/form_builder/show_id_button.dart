import 'package:flutter/material.dart';

class ShowIdButton extends StatefulWidget {
  final VoidCallback? onPressed;
  const ShowIdButton({super.key, this.onPressed});

  @override
  State<ShowIdButton> createState() => _ShowIdButtonState();
}

class _ShowIdButtonState extends State<ShowIdButton> {
  bool isActive = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      tooltip: isActive ? 'Hide ID' : 'Show ID',
      isSelected: isActive,
      selectedIcon: CircleAvatar(
        backgroundColor: Colors.blue,
        child: Text(
          'ID',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      onPressed: () {
        setState(() {
          isActive = !isActive;
          widget.onPressed?.call();
        });
      },
      icon: CircleAvatar(
        child: Text(
          'ID',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
