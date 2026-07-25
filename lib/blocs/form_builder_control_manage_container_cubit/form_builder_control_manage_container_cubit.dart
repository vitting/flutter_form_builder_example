import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_control_manage_container_cubit/form_builder_control_manage_container_state.dart';

class FormBuilderReorderCubit extends Cubit<FormBuilderControlManageContainerState> {
  FormBuilderReorderCubit() : super(const FormBuilderControlManageContainerState(showId: false, showReorder: false));

  void toggleReorderMode() {
    emit(state.copyWith(showReorder: !state.showReorder));
  }

  void toggleShowId() {
    emit(state.copyWith(showId: !state.showId));
  }
}
