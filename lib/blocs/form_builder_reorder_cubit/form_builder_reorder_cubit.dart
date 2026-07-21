import 'package:flutter_bloc/flutter_bloc.dart';

class FormBuilderReorderCubit extends Cubit<bool> {
  FormBuilderReorderCubit() : super(false);

  void toggleReorderMode() {
    emit(!state);
  }
}
