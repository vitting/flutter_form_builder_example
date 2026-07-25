// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'form_builder_item.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$FormBuilderItemCWProxy<T extends FormBuilderItemProperties> {
  FormBuilderItem<T> id(String id);

  FormBuilderItem<T> controlType(ControlTypesEnum controlType);

  FormBuilderItem<T> parentContainerId(String? parentContainerId);

  FormBuilderItem<T> columnId(String? columnId);

  FormBuilderItem<T> columnIndex(int? columnIndex);

  FormBuilderItem<T> properties(T? properties);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItem<T>(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItem<T>(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItem<T> call({
    String id,
    ControlTypesEnum controlType,
    String? parentContainerId,
    String? columnId,
    int? columnIndex,
    T? properties,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFormBuilderItem.copyWith(...)` or call `instanceOfFormBuilderItem.copyWith.fieldName(value)` for a single field.
class _$FormBuilderItemCWProxyImpl<T extends FormBuilderItemProperties>
    implements _$FormBuilderItemCWProxy<T> {
  const _$FormBuilderItemCWProxyImpl(this._value);

  final FormBuilderItem<T> _value;

  @override
  FormBuilderItem<T> id(String id) => call(id: id);

  @override
  FormBuilderItem<T> controlType(ControlTypesEnum controlType) =>
      call(controlType: controlType);

  @override
  FormBuilderItem<T> parentContainerId(String? parentContainerId) =>
      call(parentContainerId: parentContainerId);

  @override
  FormBuilderItem<T> columnId(String? columnId) => call(columnId: columnId);

  @override
  FormBuilderItem<T> columnIndex(int? columnIndex) =>
      call(columnIndex: columnIndex);

  @override
  FormBuilderItem<T> properties(T? properties) => call(properties: properties);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItem<T>(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItem<T>(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItem<T> call({
    Object? id = const $CopyWithPlaceholder(),
    Object? controlType = const $CopyWithPlaceholder(),
    Object? parentContainerId = const $CopyWithPlaceholder(),
    Object? columnId = const $CopyWithPlaceholder(),
    Object? columnIndex = const $CopyWithPlaceholder(),
    Object? properties = const $CopyWithPlaceholder(),
  }) {
    return FormBuilderItem<T>(
      id: id == const $CopyWithPlaceholder() || id == null
          ? _value.id
          // ignore: cast_nullable_to_non_nullable
          : id as String,
      controlType:
          controlType == const $CopyWithPlaceholder() || controlType == null
          ? _value.controlType
          // ignore: cast_nullable_to_non_nullable
          : controlType as ControlTypesEnum,
      parentContainerId: parentContainerId == const $CopyWithPlaceholder()
          ? _value.parentContainerId
          // ignore: cast_nullable_to_non_nullable
          : parentContainerId as String?,
      columnId: columnId == const $CopyWithPlaceholder()
          ? _value.columnId
          // ignore: cast_nullable_to_non_nullable
          : columnId as String?,
      columnIndex: columnIndex == const $CopyWithPlaceholder()
          ? _value.columnIndex
          // ignore: cast_nullable_to_non_nullable
          : columnIndex as int?,
      properties: properties == const $CopyWithPlaceholder()
          ? _value.properties
          // ignore: cast_nullable_to_non_nullable
          : properties as T?,
    );
  }
}

extension $FormBuilderItemCopyWith<T extends FormBuilderItemProperties>
    on FormBuilderItem<T> {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFormBuilderItem.copyWith(...)` or `instanceOfFormBuilderItem.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FormBuilderItemCWProxy<T> get copyWith =>
      _$FormBuilderItemCWProxyImpl<T>(this);
}

abstract class _$FormBuilderItemPropertiesTextFieldCWProxy {
  FormBuilderItemPropertiesTextField label(String? label);

  FormBuilderItemPropertiesTextField hintText(String? hintText);

  FormBuilderItemPropertiesTextField defaultValue(String? defaultValue);

  FormBuilderItemPropertiesTextField required(bool? required);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItemPropertiesTextField(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItemPropertiesTextField(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItemPropertiesTextField call({
    String? label,
    String? hintText,
    String? defaultValue,
    bool? required,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFormBuilderItemPropertiesTextField.copyWith(...)` or call `instanceOfFormBuilderItemPropertiesTextField.copyWith.fieldName(value)` for a single field.
class _$FormBuilderItemPropertiesTextFieldCWProxyImpl
    implements _$FormBuilderItemPropertiesTextFieldCWProxy {
  const _$FormBuilderItemPropertiesTextFieldCWProxyImpl(this._value);

  final FormBuilderItemPropertiesTextField _value;

  @override
  FormBuilderItemPropertiesTextField label(String? label) => call(label: label);

  @override
  FormBuilderItemPropertiesTextField hintText(String? hintText) =>
      call(hintText: hintText);

  @override
  FormBuilderItemPropertiesTextField defaultValue(String? defaultValue) =>
      call(defaultValue: defaultValue);

  @override
  FormBuilderItemPropertiesTextField required(bool? required) =>
      call(required: required);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItemPropertiesTextField(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItemPropertiesTextField(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItemPropertiesTextField call({
    Object? label = const $CopyWithPlaceholder(),
    Object? hintText = const $CopyWithPlaceholder(),
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? required = const $CopyWithPlaceholder(),
  }) {
    return FormBuilderItemPropertiesTextField(
      label: label == const $CopyWithPlaceholder()
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String?,
      hintText: hintText == const $CopyWithPlaceholder()
          ? _value.hintText
          // ignore: cast_nullable_to_non_nullable
          : hintText as String?,
      defaultValue: defaultValue == const $CopyWithPlaceholder()
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as String?,
      required: required == const $CopyWithPlaceholder()
          ? _value.required
          // ignore: cast_nullable_to_non_nullable
          : required as bool?,
    );
  }
}

extension $FormBuilderItemPropertiesTextFieldCopyWith
    on FormBuilderItemPropertiesTextField {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFormBuilderItemPropertiesTextField.copyWith(...)` or `instanceOfFormBuilderItemPropertiesTextField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FormBuilderItemPropertiesTextFieldCWProxy get copyWith =>
      _$FormBuilderItemPropertiesTextFieldCWProxyImpl(this);
}

abstract class _$FormBuilderItemPropertiesNumberFieldCWProxy {
  FormBuilderItemPropertiesNumberField label(String? label);

  FormBuilderItemPropertiesNumberField hintText(String? hintText);

  FormBuilderItemPropertiesNumberField defaultValue(String? defaultValue);

  FormBuilderItemPropertiesNumberField required(bool? required);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItemPropertiesNumberField(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItemPropertiesNumberField(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItemPropertiesNumberField call({
    String? label,
    String? hintText,
    String? defaultValue,
    bool? required,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFormBuilderItemPropertiesNumberField.copyWith(...)` or call `instanceOfFormBuilderItemPropertiesNumberField.copyWith.fieldName(value)` for a single field.
class _$FormBuilderItemPropertiesNumberFieldCWProxyImpl
    implements _$FormBuilderItemPropertiesNumberFieldCWProxy {
  const _$FormBuilderItemPropertiesNumberFieldCWProxyImpl(this._value);

  final FormBuilderItemPropertiesNumberField _value;

  @override
  FormBuilderItemPropertiesNumberField label(String? label) =>
      call(label: label);

  @override
  FormBuilderItemPropertiesNumberField hintText(String? hintText) =>
      call(hintText: hintText);

  @override
  FormBuilderItemPropertiesNumberField defaultValue(String? defaultValue) =>
      call(defaultValue: defaultValue);

  @override
  FormBuilderItemPropertiesNumberField required(bool? required) =>
      call(required: required);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItemPropertiesNumberField(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItemPropertiesNumberField(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItemPropertiesNumberField call({
    Object? label = const $CopyWithPlaceholder(),
    Object? hintText = const $CopyWithPlaceholder(),
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? required = const $CopyWithPlaceholder(),
  }) {
    return FormBuilderItemPropertiesNumberField(
      label: label == const $CopyWithPlaceholder()
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String?,
      hintText: hintText == const $CopyWithPlaceholder()
          ? _value.hintText
          // ignore: cast_nullable_to_non_nullable
          : hintText as String?,
      defaultValue: defaultValue == const $CopyWithPlaceholder()
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as String?,
      required: required == const $CopyWithPlaceholder()
          ? _value.required
          // ignore: cast_nullable_to_non_nullable
          : required as bool?,
    );
  }
}

extension $FormBuilderItemPropertiesNumberFieldCopyWith
    on FormBuilderItemPropertiesNumberField {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFormBuilderItemPropertiesNumberField.copyWith(...)` or `instanceOfFormBuilderItemPropertiesNumberField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FormBuilderItemPropertiesNumberFieldCWProxy get copyWith =>
      _$FormBuilderItemPropertiesNumberFieldCWProxyImpl(this);
}

abstract class _$FormBuilderItemPropertiesCheckboxFieldCWProxy {
  FormBuilderItemPropertiesCheckboxField label(String? label);

  FormBuilderItemPropertiesCheckboxField defaultValue(bool? defaultValue);

  FormBuilderItemPropertiesCheckboxField required(bool? required);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItemPropertiesCheckboxField(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItemPropertiesCheckboxField(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItemPropertiesCheckboxField call({
    String? label,
    bool? defaultValue,
    bool? required,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFormBuilderItemPropertiesCheckboxField.copyWith(...)` or call `instanceOfFormBuilderItemPropertiesCheckboxField.copyWith.fieldName(value)` for a single field.
class _$FormBuilderItemPropertiesCheckboxFieldCWProxyImpl
    implements _$FormBuilderItemPropertiesCheckboxFieldCWProxy {
  const _$FormBuilderItemPropertiesCheckboxFieldCWProxyImpl(this._value);

  final FormBuilderItemPropertiesCheckboxField _value;

  @override
  FormBuilderItemPropertiesCheckboxField label(String? label) =>
      call(label: label);

  @override
  FormBuilderItemPropertiesCheckboxField defaultValue(bool? defaultValue) =>
      call(defaultValue: defaultValue);

  @override
  FormBuilderItemPropertiesCheckboxField required(bool? required) =>
      call(required: required);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItemPropertiesCheckboxField(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItemPropertiesCheckboxField(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItemPropertiesCheckboxField call({
    Object? label = const $CopyWithPlaceholder(),
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? required = const $CopyWithPlaceholder(),
  }) {
    return FormBuilderItemPropertiesCheckboxField(
      label: label == const $CopyWithPlaceholder()
          ? _value.label
          // ignore: cast_nullable_to_non_nullable
          : label as String?,
      defaultValue: defaultValue == const $CopyWithPlaceholder()
          ? _value.defaultValue
          // ignore: cast_nullable_to_non_nullable
          : defaultValue as bool?,
      required: required == const $CopyWithPlaceholder()
          ? _value.required
          // ignore: cast_nullable_to_non_nullable
          : required as bool?,
    );
  }
}

extension $FormBuilderItemPropertiesCheckboxFieldCopyWith
    on FormBuilderItemPropertiesCheckboxField {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFormBuilderItemPropertiesCheckboxField.copyWith(...)` or `instanceOfFormBuilderItemPropertiesCheckboxField.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FormBuilderItemPropertiesCheckboxFieldCWProxy get copyWith =>
      _$FormBuilderItemPropertiesCheckboxFieldCWProxyImpl(this);
}

abstract class _$FormBuilderItemPropertiesColumnsCWProxy {
  FormBuilderItemPropertiesColumns columns(
    Map<String, List<FormBuilderItem<FormBuilderItemProperties>>> columns,
  );

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItemPropertiesColumns(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItemPropertiesColumns(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItemPropertiesColumns call({
    Map<String, List<FormBuilderItem<FormBuilderItemProperties>>> columns,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfFormBuilderItemPropertiesColumns.copyWith(...)` or call `instanceOfFormBuilderItemPropertiesColumns.copyWith.fieldName(value)` for a single field.
class _$FormBuilderItemPropertiesColumnsCWProxyImpl
    implements _$FormBuilderItemPropertiesColumnsCWProxy {
  const _$FormBuilderItemPropertiesColumnsCWProxyImpl(this._value);

  final FormBuilderItemPropertiesColumns _value;

  @override
  FormBuilderItemPropertiesColumns columns(
    Map<String, List<FormBuilderItem<FormBuilderItemProperties>>> columns,
  ) => call(columns: columns);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `FormBuilderItemPropertiesColumns(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// FormBuilderItemPropertiesColumns(...).copyWith(id: 12, name: "My name")
  /// ```
  FormBuilderItemPropertiesColumns call({
    Object? columns = const $CopyWithPlaceholder(),
  }) {
    return FormBuilderItemPropertiesColumns(
      columns: columns == const $CopyWithPlaceholder() || columns == null
          ? _value.columns
          // ignore: cast_nullable_to_non_nullable
          : columns
                as Map<
                  String,
                  List<FormBuilderItem<FormBuilderItemProperties>>
                >,
    );
  }
}

extension $FormBuilderItemPropertiesColumnsCopyWith
    on FormBuilderItemPropertiesColumns {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfFormBuilderItemPropertiesColumns.copyWith(...)` or `instanceOfFormBuilderItemPropertiesColumns.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$FormBuilderItemPropertiesColumnsCWProxy get copyWith =>
      _$FormBuilderItemPropertiesColumnsCWProxyImpl(this);
}
