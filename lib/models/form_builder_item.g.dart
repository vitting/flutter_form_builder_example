// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_builder_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FormBuilderItemCWProxy {
  FormBuilderItem id(String id);

  FormBuilderItem controlType(ControlTypesEnum controlType);

  FormBuilderItem formElementType(FormElementTypeEnum formElementType);

  FormBuilderItem children(List<FormBuilderItem> children);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItem(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItem(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItem call({
    String id,
    ControlTypesEnum controlType,
    FormElementTypeEnum formElementType,
    List<FormBuilderItem> children,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFormBuilderItem.copyWith(...)` or call `instanceOfFormBuilderItem.copyWith.fieldName(value)` for a single field.
class _$FormBuilderItemCWProxyImpl implements _$FormBuilderItemCWProxy {
  const _$FormBuilderItemCWProxyImpl(this._value);

  final FormBuilderItem _value;

  @override
  FormBuilderItem id(String id) => call(id: id);

  @override
  FormBuilderItem controlType(ControlTypesEnum controlType) =>
      call(controlType: controlType);

  @override
  FormBuilderItem formElementType(FormElementTypeEnum formElementType) =>
      call(formElementType: formElementType);

  @override
  FormBuilderItem children(List<FormBuilderItem> children) =>
      call(children: children);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItem(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItem(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItem call({
    Object? id = const $CopyWithPlaceholder(),
    Object? controlType = const $CopyWithPlaceholder(),
    Object? formElementType = const $CopyWithPlaceholder(),
    Object? children = const $CopyWithPlaceholder(),
  }) {
    return FormBuilderItem(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      controlType:
          controlType == const $CopyWithPlaceholder() || controlType == null
          ? _value.controlType
          // ignore: cast_nullable_to_non_nullable
          : controlType as ControlTypesEnum,
      formElementType:
          formElementType == const $CopyWithPlaceholder() ||
              formElementType == null
          ? _value.formElementType
          // ignore: cast_nullable_to_non_nullable
          : formElementType as FormElementTypeEnum,
      children: children == const $CopyWithPlaceholder() || children == null
          ? _value.children
          // ignore: cast_nullable_to_non_nullable
          : children as List<FormBuilderItem>,
    );
  }
}

extension $FormBuilderItemCopyWith on FormBuilderItem {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFormBuilderItem.copyWith(...)` or `instanceOfFormBuilderItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FormBuilderItemCWProxy get copyWith => _$FormBuilderItemCWProxyImpl(this);
}
