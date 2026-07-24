import 'dart:async';

import 'package:flutter/material.dart';

class MetaSidebarController extends ChangeNotifier {
  bool _isOpen = false;
  bool get isOpen => _isOpen;
  bool _canBeResized = false;
  bool get canBeResized => _canBeResized;
  String? _title;
  String? get title => _title;

  Widget? content;
  Completer<void>? _closeCompleter;

  Future<void> show(Widget content, {bool canBeResized = false, String? title}) {
    _closeCompleter = Completer<void>();
    _isOpen = true;
    _canBeResized = canBeResized;
    _title = title;
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
