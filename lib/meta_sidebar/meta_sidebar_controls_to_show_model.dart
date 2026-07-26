import 'package:equatable/equatable.dart';

class MetaSidebarControlsToShowModel extends Equatable {
  final bool showDefaultValue;
  final bool showDefaultValueTrueFalse;
  final bool showLabel;
  final bool showHeading;
  final bool showHintText;
  final bool showRequired;

  const MetaSidebarControlsToShowModel({
    required this.showDefaultValue,
    required this.showDefaultValueTrueFalse,
    required this.showLabel,
    required this.showHeading,
    required this.showHintText,
    required this.showRequired,
  });

  @override
  List<Object?> get props => [showDefaultValue, showDefaultValueTrueFalse, showLabel, showHeading, showHintText, showRequired];

  @override
  bool get stringify => true;
}
