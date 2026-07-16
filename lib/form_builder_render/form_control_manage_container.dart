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
        duration: Duration(milliseconds: 200),
        crossFadeState: isHovered ? CrossFadeState.showFirst : CrossFadeState.showSecond,
        firstChild: Container(
          padding: EdgeInsets.all(8),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey),
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
        secondChild: widget.child,
      ),
    );
  }
}
