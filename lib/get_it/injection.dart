import 'package:flutter_form_builder_example/repositories/form_builder_repository.dart';
import 'package:flutter_form_builder_example/repositories/form_render_builder_repository.dart';
import 'package:flutter_form_builder_example/services/form_builder_service.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  if (!getIt.isRegistered<FormRenderBuilderRepository>()) {
    getIt.registerSingleton<FormRenderBuilderRepository>(FormRenderBuilderRepository());
  }

  getIt.registerSingleton<SharedPreferencesAsync>(SharedPreferencesAsync());

  getIt.registerSingleton<FormBuilderService>(FormBuilderServiceImpl(getIt<SharedPreferencesAsync>()));

  getIt.registerSingleton<FormBuilderRepository>(FormBuilderRepositoryImpl(getIt<FormBuilderService>()));
}
