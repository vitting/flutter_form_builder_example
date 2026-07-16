// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_builder_state.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FormBuilderStateCWProxy {
  FormBuilderState items(List<FormBuilderItem> items);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderState(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderState call({List<FormBuilderItem> items});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFormBuilderState.copyWith(...)` or call `instanceOfFormBuilderState.copyWith.fieldName(value)` for a single field.
class _$FormBuilderStateCWProxyImpl implements _$FormBuilderStateCWProxy {
  const _$FormBuilderStateCWProxyImpl(this._value);

  final FormBuilderState _value;

  @override
  FormBuilderState items(List<FormBuilderItem> items) => call(items: items);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderState(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderState call({Object? items = const $CopyWithPlaceholder()}) {
    return FormBuilderState(
      items: items == const $CopyWithPlaceholder() || items == null
          ? _value.items
          // ignore: cast_nullable_to_non_nullable
          : items as List<FormBuilderItem>,
    );
  }
}

extension $FormBuilderStateCopyWith on FormBuilderState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFormBuilderState.copyWith(...)` or `instanceOfFormBuilderState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FormBuilderStateCWProxy get copyWith => _$FormBuilderStateCWProxyImpl(this);
}
