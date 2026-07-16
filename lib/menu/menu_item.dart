import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/models/menu_item_model.dart';

class MenuItem extends StatelessWidget {
  final bool showLabels;
  final bool showLabelSlot;
  final double fadeProgress;
  final MenuItemModel item;

  const MenuItem({
    super.key,
    required this.showLabels,
    required this.showLabelSlot,
    required this.fadeProgress,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: item.label,
      child: InkWell(
        onTap: () {},
        child: SizedBox(
          height: 52,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: showLabels ? 12 : 0),
            child: Row(
              mainAxisAlignment: showLabels ? MainAxisAlignment.start : MainAxisAlignment.center,
              children: [
                Icon(item.icon, color: Colors.white),
                if (showLabelSlot) ...[
                  AnimatedContainer(duration: const Duration(milliseconds: 180), curve: Curves.easeOut, width: 12 * fadeProgress),
                  Expanded(
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 180),
                      curve: Curves.easeOut,
                      opacity: fadeProgress,
                      child:
                          item.child ??
                          Text(
                            item.label,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(color: Colors.white),
                          ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }
}
