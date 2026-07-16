import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/models/menu_model.dart';

final class MenuItemModel extends MenuModel {
  final String label;
  final IconData icon;
  final Widget? child;

  MenuItemModel({required this.label, required this.icon, this.child});
}
