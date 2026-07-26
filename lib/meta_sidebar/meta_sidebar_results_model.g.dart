// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_sidebar_results_model.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$MetaSidebarResultsModelCWProxy {
  MetaSidebarResultsModel item(FormBuilderItem<FormBuilderItemProperties> item);

  MetaSidebarResultsModel heading(String? heading);

  MetaSidebarResultsModel label(String? label);

  MetaSidebarResultsModel hintText(String? hintText);

  MetaSidebarResultsModel defaultValue(String? defaultValue);

  MetaSidebarResultsModel defaultValueTrueFalse(bool? defaultValueTrueFalse);

  MetaSidebarResultsModel required(bool? required);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `MetaSidebarResultsModel(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MetaSidebarResultsModel(...).copyWith(id: 12, name: "My name")
  /// ```
  MetaSidebarResultsModel call({
    FormBuilderItem<FormBuilderItemProperties> item,
    String? heading,
    String? label,
    String? hintText,
    String? defaultValue,
    bool? defaultValueTrueFalse,
    bool? required,
  });
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfMetaSidebarResultsModel.copyWith(...)` or call `instanceOfMetaSidebarResultsModel.copyWith.fieldName(value)` for a single field.
class _$MetaSidebarResultsModelCWProxyImpl implements _$MetaSidebarResultsModelCWProxy {
  const _$MetaSidebarResultsModelCWProxyImpl(this._value);

  final MetaSidebarResultsModel _value;

  @override
  MetaSidebarResultsModel item(FormBuilderItem<FormBuilderItemProperties> item) => call(item: item);

  @override
  MetaSidebarResultsModel heading(String? heading) => call(heading: heading);

  @override
  MetaSidebarResultsModel label(String? label) => call(label: label);

  @override
  MetaSidebarResultsModel hintText(String? hintText) => call(hintText: hintText);

  @override
  MetaSidebarResultsModel defaultValue(String? defaultValue) => call(defaultValue: defaultValue);

  @override
  MetaSidebarResultsModel defaultValueTrueFalse(bool? defaultValueTrueFalse) =>
      call(defaultValueTrueFalse: defaultValueTrueFalse);

  @override
  MetaSidebarResultsModel required(bool? required) => call(required: required);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `MetaSidebarResultsModel(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// MetaSidebarResultsModel(...).copyWith(id: 12, name: "My name")
  /// ```
  MetaSidebarResultsModel call({
    Object? item = const $CopyWithPlaceholder(),
    Object? heading = const $CopyWithPlaceholder(),
    Object? label = const $CopyWithPlaceholder(),
    Object? hintText = const $CopyWithPlaceholder(),
    Object? defaultValue = const $CopyWithPlaceholder(),
    Object? defaultValueTrueFalse = const $CopyWithPlaceholder(),
    Object? required = const $CopyWithPlaceholder(),
  }) {
    return MetaSidebarResultsModel(
      item: item == const $CopyWithPlaceholder() || item == null
          ? _value.item
          // ignore: cast_nullable_to_non_nullable
          : item as FormBuilderItem<FormBuilderItemProperties>,
      heading: heading == const $CopyWithPlaceholder()
          ? _value.heading
          // ignore: cast_nullable_to_non_nullable
          : heading as String?,
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
      defaultValueTrueFalse: defaultValueTrueFalse == const $CopyWithPlaceholder()
          ? _value.defaultValueTrueFalse
          // ignore: cast_nullable_to_non_nullable
          : defaultValueTrueFalse as bool?,
      required: required == const $CopyWithPlaceholder()
          ? _value.required
          // ignore: cast_nullable_to_non_nullable
          : required as bool?,
    );
  }
}

extension $MetaSidebarResultsModelCopyWith on MetaSidebarResultsModel {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfMetaSidebarResultsModel.copyWith(...)` or `instanceOfMetaSidebarResultsModel.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$MetaSidebarResultsModelCWProxy get copyWith => _$MetaSidebarResultsModelCWProxyImpl(this);
}
