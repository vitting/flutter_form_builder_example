import 'package:flutter/material.dart';

class MenuItemModel {
  final String label;
  final IconData icon;
  final Widget? child;

  MenuItemModel({required this.label, required this.icon, this.child});
}
