import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/sidebar/sidebar_header.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResizableSidebar extends StatefulWidget {
  final double initialSidebarWidth;
  final VoidCallback onSidebarHeaderCloseTap;
  final Widget? content;

  const ResizableSidebar({super.key, required this.initialSidebarWidth, required this.onSidebarHeaderCloseTap, this.content});

  @override
  State<ResizableSidebar> createState() => _ResizableSidebarState();
}

class _ResizableSidebarState extends State<ResizableSidebar> {
  static const double _handleWidth = 8;
  static const double _minWidth = 280;
  double _width = 400;
  final _asyncPrefs = SharedPreferencesAsync();

  @override
  void initState() {
    super.initState();
    _asyncPrefs.getDouble('sidebarWidth').then((value) {
      if (value != null) {
        setState(() {
          _width = value;
        });
      }
    });

    // _width = widget.initialSidebarWidth;
  }

  void _updateWidth(DragUpdateDetails details, double maxWidth) {
    final nextWidth = (_width - details.delta.dx).clamp(_minWidth, maxWidth);
    if (nextWidth == _width) {
      return;
    }
    setState(() {
      _width = nextWidth;
      _asyncPrefs.setDouble('sidebarWidth', _width);
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final maxWidth = constraints.maxWidth.isFinite ? constraints.maxWidth : MediaQuery.sizeOf(context).width;
        final clampedWidth = _width.clamp(_minWidth, maxWidth);

        return SizedBox(
          width: clampedWidth,
          child: Stack(
            children: [
              Positioned.fill(
                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                      SidebarHeader(onClose: widget.onSidebarHeaderCloseTap),
                      Expanded(child: SingleChildScrollView(child: widget.content ?? const SizedBox())),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: MouseRegion(
                  cursor: SystemMouseCursors.resizeLeftRight,
                  child: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onHorizontalDragUpdate: (details) => _updateWidth(details, maxWidth),
                    child: Container(width: _handleWidth, color: Colors.transparent),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
