import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_reorder_cubit/form_builder_reorder_cubit.dart';
import 'package:flutter_form_builder_example/form_builder/form_control_manage_container_controller.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

FormControlManageContainerController formControlManageContainerController = FormControlManageContainerController();

class FormControlManageContainer extends StatefulWidget {
  final FormBuilderItem item;
  final Widget child;
  final int dragHandlerReOrderListIndex;
  const FormControlManageContainer({
    super.key,
    required this.child,
    required this.dragHandlerReOrderListIndex,
    required this.item,
  });

  @override
  State<FormControlManageContainer> createState() => _FormControlManageContainerState();
}

class _FormControlManageContainerState extends State<FormControlManageContainer> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (event) {
        setState(() {
          isHovered = false;
        });
      },
      child: ListenableBuilder(
        listenable: formControlManageContainerController,
        builder: (context, _) {
          return GestureDetector(
            onTap: () {
              formControlManageContainerController.setCurrentActiveControlId(widget.item.id);
            },
            child: BlocBuilder<FormBuilderReorderCubit, bool>(
              builder: (context, state) {
                return AnimatedCrossFade(
                  duration: Duration(milliseconds: 300),
                  firstCurve: Curves.easeOut,
                  secondCurve: Curves.linear,
                  crossFadeState: formControlManageContainerController.currentActiveControlId == widget.item.id && state == false
                      ? CrossFadeState.showFirst
                      : CrossFadeState.showSecond,

                  firstChild: Container(
                    margin: EdgeInsets.symmetric(vertical: 8),
                    padding: EdgeInsets.all(8),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.white,
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
                              onPressed: () {
                                BlocProvider.of<FormBuilderBloc>(context).add(
                                  RemoveFormBuilderItemEvent(
                                    itemId: widget.item.id,
                                    parentContainerId: widget.item.parentContainerId,
                                    columnId: widget.item.columnId,
                                  ),
                                );
                              },
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
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              border: isHovered && state == false ? Border.all(color: Colors.grey) : null,
                              borderRadius: BorderRadius.circular(8),
                              color: isHovered && state == false ? Colors.grey.shade300 : Colors.transparent,
                            ),

                            child: widget.child,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
