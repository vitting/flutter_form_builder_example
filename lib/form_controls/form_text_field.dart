import 'package:flutter/material.dart';

class FormTextField extends StatefulWidget {
  final String label;
  final bool isFormRenderControl;
  final bool isEnabled;
  final String? initialValue;
  final void Function(String value)? onChanged;
  final TextEditingController? controller;
  final bool isRequired;
  const FormTextField({
    super.key,
    required this.label,
    this.isFormRenderControl = false,
    this.isEnabled = false,
    this.onChanged,
    this.controller,
    this.initialValue,
    this.isRequired = false,
  });

  @override
  State<FormTextField> createState() => _FormTextFieldState();
}

class _FormTextFieldState extends State<FormTextField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    if (widget.controller != null) {
      _controller = widget.controller!;
    } else {
      _controller = TextEditingController(text: widget.initialValue ?? '');
    }
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant FormTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      _controller.text = widget.initialValue ?? '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color.fromARGB(0, 82, 80, 80),
      child: TextField(
        controller: _controller,
        onChanged: widget.onChanged,
        enabled: widget.isEnabled,
        decoration: InputDecoration(
          floatingLabelBehavior: widget.isFormRenderControl ? FloatingLabelBehavior.always : FloatingLabelBehavior.auto,
          labelStyle: TextStyle(color: widget.isFormRenderControl ? Colors.black : Colors.white),
          labelText: widget.label + (widget.isRequired ? ' *' : ''),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: widget.isFormRenderControl ? Colors.black : Colors.white, width: 1),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: widget.isFormRenderControl ? Colors.black : Colors.white, width: 1),
          ),
        ),
      ),
    );
  }
}
