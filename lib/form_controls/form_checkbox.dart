import 'package:flutter/material.dart';

class FormCheckbox extends StatelessWidget {
  final String label;
  final bool isFormRenderControl;
  final bool isEnabled;
  const FormCheckbox({super.key, required this.label, this.isFormRenderControl = false, this.isEnabled = false});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: CheckboxListTile(
        title: Text('Checkbox', style: TextStyle(color: isFormRenderControl ? Colors.black : Colors.white)),
        enabled: isEnabled,
        value: !isFormRenderControl,
        onChanged: (value) {},
      ),
    );
  }
}
