import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/meta_sidebar/meta_sidebar_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MetaSidebar extends StatefulWidget {
  final MetaSidebarController controller;
  const MetaSidebar({super.key, required this.controller});

  @override
  State<MetaSidebar> createState() => _MetaSidebarState();
}

class _MetaSidebarState extends State<MetaSidebar> {
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
    return ListenableBuilder(
      listenable: widget.controller,
      builder: (context, child) {
        return AnimatedContainer(
          duration: Duration(milliseconds: 280),
          width: widget.controller.isOpen ? 500 : 0,
          height: double.infinity,
          color: Colors.yellow,
          child: Column(
            children: [
              Text('Sidebar'),
              ElevatedButton(
                onPressed: () {
                  widget.controller.close();
                },
                child: Text('Toggle Sidebar'),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        'This is a long text for the sidebar and it will continue for a while to test the scrolling behavior of the sidebar.',
                      ),
                      ...List.generate(
                        30,
                        (index) => ListTile(
                          title: Text(
                            'This is a long text for Item $index and it will continue for a while to test the scrolling behavior of the sidebar.',
                          ),
                        ),
                      ),
                    ],
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
