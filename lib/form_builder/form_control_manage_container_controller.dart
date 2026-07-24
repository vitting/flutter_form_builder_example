import 'package:flutter/material.dart';

class FormControlManageContainerController extends ChangeNotifier {
  String? _currentActiveControlId = '';
  String? get currentActiveControlId => _currentActiveControlId;

  void setCurrentActiveControlId(String? controlId) {
    _currentActiveControlId = controlId;
    notifyListeners();
  }
}
