import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/control_types_enum.dart';

class MenuTextField extends StatelessWidget {
  final String label;
  const MenuTextField({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Draggable(
      data: ControlTypesEnum.textField,
      feedback: TextFieldMenuPreview(isDragging: true, label: label),
      childWhenDragging: TextFieldMenuPreview(isDragging: true, label: label),
      child: TextFieldMenuPreview(label: label),
    );
  }
}

class TextFieldMenuPreview extends StatelessWidget {
  final String label;
  final bool isDragging;
  const TextFieldMenuPreview({super.key, this.isDragging = false, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isDragging ? Colors.white.withAlpha(100) : Colors.transparent,
      width: 230,
      child: Material(
        color: Colors.transparent,
        child: TextField(
          readOnly: true,
          enabled: false,
          decoration: InputDecoration(
            labelStyle: TextStyle(color: Colors.white),
            labelText: label,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: Colors.white, width: 1),
            ),
          ),
        ),
      ),
    );
  }
}
