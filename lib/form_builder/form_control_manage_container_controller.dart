import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';

class FormControlManageContainerController extends ChangeNotifier {
  FormBuilderItem? _currentActiveControl;
  FormBuilderItem? get currentActiveControl => _currentActiveControl;

  void setCurrentActiveControlId(FormBuilderItem? controlItem) {
    if (_currentActiveControl == controlItem) {
      _currentActiveControl = null;
    } else {
      _currentActiveControl = controlItem;
    }

    notifyListeners();
  }
}
