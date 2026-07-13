import 'dart:async';

import 'package:flutter/material.dart';

class SidebarController extends ChangeNotifier {
  bool _isOpen = false;
  bool get isOpen => _isOpen;
  bool _showFullPageOverlay = false;
  bool get showFullPageOverlay => _showFullPageOverlay;
  bool _canBeResized = false;
  bool get canBeResized => _canBeResized;

  final OverlayPortalController sidebarOverlayController = OverlayPortalController();
  Widget? content;
  Completer<void>? _closeCompleter;

  Future<void> show(Widget content, {bool canBeResized = false, bool showFullPageOverlay = true}) {
    _closeCompleter = Completer<void>();
    _showFullPageOverlay = showFullPageOverlay;
    _isOpen = true;
    _canBeResized = canBeResized;
    this.content = content;
    sidebarOverlayController.show();
    notifyListeners();

    return _closeCompleter!.future;
  }

  void close() {
    _showFullPageOverlay = false;
    _isOpen = false;
    sidebarOverlayController.hide();
    notifyListeners();

    _closeCompleter!.complete();
    _closeCompleter = null;
  }
}
