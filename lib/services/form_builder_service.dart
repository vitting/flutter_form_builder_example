import 'dart:convert';

import 'package:flutter_form_builder_example/converter/form_api_example.dart';
import 'package:flutter_form_builder_example/models/form_api_model/form_api_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract interface class FormBuilderService {
  Future<void> saveFormApiModel(FormApiModel formApiModel);
  Future<FormApiModel?> loadFormApiModel();
  Future<FormApiModel?> loadFormApiModelExample();
  Future<void> clearFormApiModel();
}

class FormBuilderServiceImpl implements FormBuilderService {
  final SharedPreferencesAsync _sharedPreferencesAsync;

  FormBuilderServiceImpl(this._sharedPreferencesAsync);

  @override
  Future<void> saveFormApiModel(FormApiModel formApiModel) async {
    final jsonString = formApiModel.toJson();
    final jsonStringEncoded = jsonEncode(jsonString);
    await _sharedPreferencesAsync.setString('form_api_model', jsonStringEncoded);
  }

  @override
  Future<FormApiModel?> loadFormApiModel() async {
    final jsonString = await _sharedPreferencesAsync.getString('form_api_model');
    if (jsonString != null) {
      final jsonMap = jsonDecode(jsonString) as Map<String, dynamic>;
      return FormApiModel.fromJson(jsonMap);
    }
    return null;
  }

  @override
  Future<void> clearFormApiModel() {
    return _sharedPreferencesAsync.remove('form_api_model');
  }

  @override
  Future<FormApiModel?> loadFormApiModelExample() async {
    return formApiExample;
  }
}
