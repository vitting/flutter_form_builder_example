import 'package:flutter/material.dart';

class FormTextField extends StatelessWidget {
  final String label;
  final bool isFormRenderControl;
  final bool isEnabled;
  const FormTextField({super.key, required this.label, this.isFormRenderControl = false, this.isEnabled = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(0, 82, 80, 80),
      child: TextField(
        enabled: isEnabled,
        decoration: InputDecoration(
          floatingLabelBehavior: isFormRenderControl ? FloatingLabelBehavior.always : FloatingLabelBehavior.auto,
          labelStyle: TextStyle(color: isFormRenderControl ? Colors.black : Colors.white),
          labelText: label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: isFormRenderControl ? Colors.black : Colors.white, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: isFormRenderControl ? Colors.black : Colors.white, width: 1),
          ),
        ),
      ),
    );
  }
}
