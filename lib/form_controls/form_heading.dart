import 'package:flutter/material.dart';

class FormHeading extends StatelessWidget {
  final String text;
  final Color textColor;
  const FormHeading({super.key, required this.text, this.textColor = Colors.black});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
