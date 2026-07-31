import 'package:flutter/material.dart';

class FormCheckbox extends StatefulWidget {
  final String label;
  final bool isFormRenderControl;
  final bool isEnabled;
  final bool initialValue;
  final bool isRequired;
  final void Function(bool value)? onChanged;
  const FormCheckbox({
    super.key,
    required this.label,
    this.isFormRenderControl = false,
    this.isEnabled = false,
    this.initialValue = false,
    this.isRequired = false,
    this.onChanged,
  });

  @override
  State<FormCheckbox> createState() => _FormCheckboxState();
}

class _FormCheckboxState extends State<FormCheckbox> {
  late bool _isChecked;

  @override
  initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  didUpdateWidget(covariant FormCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() {
        _isChecked = widget.initialValue;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Material(
        color: Colors.transparent,
        child: CheckboxListTile(
          title: Text(
            widget.label + (widget.isRequired ? ' *' : ''),
            style: TextStyle(color: widget.isFormRenderControl ? Colors.black : Colors.white),
          ),
          enabled: widget.isEnabled,
          value: _isChecked,
          onChanged: (value) {
            if (widget.isEnabled) {
              setState(() {
                widget.onChanged?.call(value ?? false);
                _isChecked = value ?? false;
              });
            }
          },
        ),
      ),
    );
  }
}
