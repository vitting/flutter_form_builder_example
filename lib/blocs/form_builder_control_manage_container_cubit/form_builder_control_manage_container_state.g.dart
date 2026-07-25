// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_builder_control_manage_container_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FormBuilderControlManageContainerStateCWProxy {
  FormBuilderControlManageContainerState showId(bool showId);

  FormBuilderControlManageContainerState showReorder(bool showReorder);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderControlManageContainerState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderControlManageContainerState(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderControlManageContainerState call({bool showId, bool showReorder});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFormBuilderControlManageContainerState.copyWith(...)` or call `instanceOfFormBuilderControlManageContainerState.copyWith.fieldName(value)` for a single field.
class _$FormBuilderControlManageContainerStateCWProxyImpl
    implements _$FormBuilderControlManageContainerStateCWProxy {
  const _$FormBuilderControlManageContainerStateCWProxyImpl(this._value);

  final FormBuilderControlManageContainerState _value;

  @override
  FormBuilderControlManageContainerState showId(bool showId) =>
      call(showId: showId);

  @override
  FormBuilderControlManageContainerState showReorder(bool showReorder) =>
      call(showReorder: showReorder);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderControlManageContainerState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderControlManageContainerState(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderControlManageContainerState call({
    Object? showId = const $CopyWithPlaceholder(),
    Object? showReorder = const $CopyWithPlaceholder(),
  }) {
    return FormBuilderControlManageContainerState(
      showId: showId == const $CopyWithPlaceholder() || showId == null
          ? _value.showId
          // ignore: cast_nullable_to_non_nullable
          : showId as bool,
      showReorder:
          showReorder == const $CopyWithPlaceholder() || showReorder == null
          ? _value.showReorder
          // ignore: cast_nullable_to_non_nullable
          : showReorder as bool,
    );
  }
}

extension $FormBuilderControlManageContainerStateCopyWith
    on FormBuilderControlManageContainerState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFormBuilderControlManageContainerState.copyWith(...)` or `instanceOfFormBuilderControlManageContainerState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FormBuilderControlManageContainerStateCWProxy get copyWith =>
      _$FormBuilderControlManageContainerStateCWProxyImpl(this);
}
