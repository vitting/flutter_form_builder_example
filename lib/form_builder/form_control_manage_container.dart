import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_reorder_cubit/form_builder_reorder_cubit.dart';

class FormControlManageContainer extends StatefulWidget {
  final Widget child;
  final VoidCallback? onDelete;
  final int dragHandlerReOrderListIndex;
  const FormControlManageContainer({super.key, required this.child, this.onDelete, required this.dragHandlerReOrderListIndex});

  @override
  State<FormControlManageContainer> createState() => _FormControlManageContainerState();
}

class _FormControlManageContainerState extends State<FormControlManageContainer> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: BlocBuilder<FormBuilderReorderCubit, bool>(
        builder: (context, state) {
          return AnimatedCrossFade(
            duration: Duration(milliseconds: 300),
            firstCurve: Curves.easeOut,
            secondCurve: Curves.linear,
            crossFadeState: isHovered && state == false ? CrossFadeState.showFirst : CrossFadeState.showSecond,

            firstChild: Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              padding: EdgeInsets.all(8),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      IconButton(
                        icon: Icon(Icons.delete, color: Colors.black),
                        onPressed: widget.onDelete,
                      ),
                    ],
                  ),
                  widget.child,
                ],
              ),
            ),
            secondChild: Container(
              width: double.infinity,
              padding: EdgeInsets.all(8),
              child: Row(
                children: [
                  AnimatedCrossFade(
                    duration: Duration(milliseconds: 200),
                    crossFadeState: state ? CrossFadeState.showFirst : CrossFadeState.showSecond,
                    firstChild: ReorderableDragStartListener(
                      index: widget.dragHandlerReOrderListIndex,
                      child: Icon(Icons.drag_indicator, color: Colors.grey),
                    ),

                    secondChild: SizedBox.shrink(),
                  ),
                  Expanded(child: widget.child),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
