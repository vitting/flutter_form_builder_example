import 'dart:async';

import 'package:flutter/material.dart';

class SidebarController extends ChangeNotifier {
  bool showFullPageOverlay = false;
  bool canBeResized = false;
  final OverlayPortalController sidebarOverlayController = OverlayPortalController();
  Widget? content;
  Completer<void>? _closeCompleter;

  Future<void> show(Widget content, {bool canBeResized = false}) {
    _closeCompleter = Completer<void>();
    showFullPageOverlay = true;
    this.canBeResized = canBeResized;
    this.content = content;
    sidebarOverlayController.show();
    notifyListeners();

    return _closeCompleter!.future;
  }

  void close() {
    showFullPageOverlay = false;
    sidebarOverlayController.hide();
    notifyListeners();

    _closeCompleter!.complete();
    _closeCompleter = null;
  }
}
