import 'package:flutter/material.dart';

class FormControlManageContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback? onDelete;
  const FormControlManageContainer({super.key, required this.child, this.onDelete});

  @override
  State<FormControlManageContainer> createState() => _FormControlManageContainerState();
}

class _FormControlManageContainerState extends State<FormControlManageContainer> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: AnimatedCrossFade(
        duration: Duration(milliseconds: 300),
        firstCurve: Curves.easeOut,
        secondCurve: Curves.linear,
        crossFadeState: isHovered ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            border: Border.all(color: Colors.blue),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    icon: Icon(Icons.delete, color: Colors.black),
                    onPressed: widget.onDelete,
                  ),
                ],
              ),
              widget.child,
            ],
          ),
        ),
        secondChild: Container(padding: EdgeInsets.all(8), child: widget.child),
      ),
    );
  }
}
