import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_control_manage_container_cubit/form_builder_control_manage_container_cubit.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_control_manage_container_cubit/form_builder_control_manage_container_state.dart';
import 'package:flutter_form_builder_example/form_builder/form_control_manage_container_controller.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';

FormControlManageContainerController formControlManageContainerController = FormControlManageContainerController();

class FormControlManageContainer extends StatefulWidget {
  final FormBuilderItem item;
  final Widget child;
  final int dragHandlerReOrderListIndex;
  final void Function(FormBuilderItem? item)? onSelected;
  const FormControlManageContainer({
    super.key,
    required this.child,
    required this.dragHandlerReOrderListIndex,
    required this.item,
    this.onSelected,
  });

  @override
  State<FormControlManageContainer> createState() => _FormControlManageContainerState();
}

class _FormControlManageContainerState extends State<FormControlManageContainer> {
  bool isHovered = false;

  bool get _isCurrentControlActive => formControlManageContainerController.currentActiveControl == widget.item;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
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
          return BlocBuilder<FormBuilderReorderCubit, FormBuilderControlManageContainerState>(
            builder: (context, state) {
              return GestureDetector(
                onTap: state.showReorder == false
                    ? () {
                        formControlManageContainerController.setCurrentActiveControlId(widget.item);
                        widget.onSelected?.call(formControlManageContainerController.currentActiveControl);
                      }
                    : null,
                child: Tooltip(
                  message: state.showId ? '' : 'Control ID: ${widget.item.id}',
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8),
                    child: Row(
                      children: [
                        AnimatedCrossFade(
                          duration: Duration(milliseconds: 200),
                          crossFadeState: state.showReorder ? CrossFadeState.showFirst : CrossFadeState.showSecond,
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
                              border: isHovered && state.showReorder == false
                                  ? Border.all(color: Colors.grey, width: 2)
                                  : _isCurrentControlActive && state.showReorder == false
                                  ? Border.all(color: Colors.blue, width: 2)
                                  : Border.all(color: Colors.transparent, width: 2),
                              borderRadius: BorderRadius.circular(8),
                              color: isHovered && state.showReorder == false ? Colors.grey.shade300 : Colors.transparent,
                            ),

                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (state.showId)
                                  Container(
                                    margin: EdgeInsets.only(bottom: 8),
                                    padding: EdgeInsets.symmetric(horizontal: 4, vertical: 2),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(4),
                                      color: _isCurrentControlActive ? Colors.blue.shade800 : Colors.grey.shade200,
                                    ),
                                    child: Text(
                                      widget.item.id,
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: _isCurrentControlActive ? Colors.white : Colors.black,
                                      ),
                                    ),
                                  ),
                                widget.child,
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
