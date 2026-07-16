import 'package:flutter/material.dart';

class MenuCheckbox extends StatelessWidget {
  const MenuCheckbox({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: CheckboxListTile(
        title: const Text('Checkbox', style: TextStyle(color: Colors.white)),
        tileColor: Colors.blue,
        enabled: false,
        value: true,
        onChanged: (value) {},
        // checkColor: Colors.white,
      ),
    );
  }
}
