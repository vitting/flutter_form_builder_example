import 'dart:async';

import 'package:flutter/material.dart';

class SidebarController extends ChangeNotifier {
  bool _isOpen = false;
  bool get isOpen => _isOpen;
  bool _showFullPageOverlay = false;
  bool get showFullPageOverlay => _showFullPageOverlay;
  bool _canBeResized = false;
  bool get canBeResized => _canBeResized;
  double _width = 400;
  double get width => _width;
  String? _title;
  String? get title => _title;

  final OverlayPortalController sidebarOverlayController = OverlayPortalController();
  Widget? content;
  Completer<void>? _closeCompleter;

  Future<void> show(
    Widget content, {
    bool canBeResized = false,
    bool showFullPageOverlay = true,
    double width = 400,
    String? title,
  }) {
    _closeCompleter = Completer<void>();
    _showFullPageOverlay = showFullPageOverlay;
    _isOpen = true;
    _width = width;
    _title = title;
    _canBeResized = canBeResized;
    this.content = content;
    sidebarOverlayController.show();
    notifyListeners();

    return _closeCompleter!.future;
  }

  void close() {
    _showFullPageOverlay = false;
    _isOpen = false;
    _title = null;
    _canBeResized = false;

    sidebarOverlayController.hide();
    notifyListeners();

    _closeCompleter!.complete();
    _closeCompleter = null;
  }
}
