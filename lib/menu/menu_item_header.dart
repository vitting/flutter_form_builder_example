import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/models/menu_item_header_model.dart';

class MenuItemHeader extends StatelessWidget {
  final MenuItemHeaderModel item;
  const MenuItemHeader({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: 40,
      width: double.infinity,
      color: Colors.blue.shade700,
      child: Row(
        children: [
          Expanded(
            child: Text(
              item.label,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }
}
