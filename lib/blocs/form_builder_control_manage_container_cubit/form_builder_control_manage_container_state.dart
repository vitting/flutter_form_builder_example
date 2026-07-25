import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:equatable/equatable.dart';

part 'form_builder_control_manage_container_state.g.dart';

@CopyWith()
final class FormBuilderControlManageContainerState extends Equatable {
  final bool showId;
  final bool showReorder;

  const FormBuilderControlManageContainerState({required this.showId, required this.showReorder});

  @override
  List<Object?> get props => [showId, showReorder];

  @override
  bool get stringify => true;
}
