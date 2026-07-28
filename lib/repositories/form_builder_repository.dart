import 'package:flutter_form_builder_example/models/form_api_model/form_api_model.dart';
import 'package:flutter_form_builder_example/services/form_builder_service.dart';

abstract interface class FormBuilderRepository {
  Future<void> saveFormApiModel(FormApiModel formApiModel);
  Future<FormApiModel?> loadFormApiModel();
  Future<void> clearFormApiModel();
  Future<FormApiModel?> loadFormApiModelExample();
}

class FormBuilderRepositoryImpl implements FormBuilderRepository {
  final FormBuilderService _formBuilderService;

  FormBuilderRepositoryImpl(this._formBuilderService);

  @override
  Future<void> saveFormApiModel(FormApiModel formApiModel) {
    return _formBuilderService.saveFormApiModel(formApiModel);
  }

  @override
  Future<FormApiModel?> loadFormApiModel() {
    return _formBuilderService.loadFormApiModel();
  }

  @override
  Future<void> clearFormApiModel() {
    return _formBuilderService.clearFormApiModel();
  }

  @override
  Future<FormApiModel?> loadFormApiModelExample() {
    return _formBuilderService.loadFormApiModelExample();
  }
}
