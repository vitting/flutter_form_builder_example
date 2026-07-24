import 'dart:async';

import 'package:flutter/material.dart';

class MetaSidebarController extends ChangeNotifier {
  bool _isOpen = false;
  bool get isOpen => _isOpen;
  bool _canBeResized = false;
  bool get canBeResized => _canBeResized;

  Widget? content;
  Completer<void>? _closeCompleter;

  Future<void> show(Widget content, {bool canBeResized = false, bool showFullPageOverlay = true}) {
    _closeCompleter = Completer<void>();
    _isOpen = true;
    _canBeResized = canBeResized;
    this.content = content;
    notifyListeners();

    return _closeCompleter!.future;
  }

  void close() {
    _isOpen = false;
    notifyListeners();

    _closeCompleter!.complete();
    _closeCompleter = null;
  }
}
