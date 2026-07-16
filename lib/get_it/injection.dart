import 'package:flutter_form_builder_example/repositories/form_render_builder_repository.dart';
import 'package:get_it/get_it.dart';

final GetIt getIt = GetIt.instance;

void setupDependencies() {
  if (!getIt.isRegistered<FormRenderBuilderRepository>()) {
    getIt.registerSingleton<FormRenderBuilderRepository>(FormRenderBuilderRepository());
  }
}
