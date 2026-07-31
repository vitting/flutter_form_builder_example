import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_bloc.dart';
import 'package:flutter_form_builder_example/drop_zone/drop_zone_container.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/models/form_builder_item/form_builder_item.dart';

class DropZone extends StatefulWidget {
  final String? parentId;
  final String? columnId;
  final int? columnIndex;
  final String? parentContainerId;
  final FormBuilderItem? parentContainerItem;
  final bool showExpaned;
  final bool isVisible;

  const DropZone({
    super.key,
    this.parentId,
    this.showExpaned = false,
    this.isVisible = true,
    this.columnId,
    this.parentContainerId,
    this.parentContainerItem,
    this.columnIndex,
  });

  @override
  State<DropZone> createState() => _DropZoneState();
}

class _DropZoneState extends State<DropZone> {
  bool _isObjectOver = false;
  bool _isRejected = false;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: widget.isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 200),
      firstCurve: Curves.easeIn,
      firstChild: DragTarget<FormBuilderItem>(
        onWillAcceptWithDetails: (details) {
          bool isValid = true;
          if (details.data.controlType == ControlTypesEnum.columns &&
              widget.parentContainerItem?.controlType == ControlTypesEnum.columns) {
            isValid = false;
          }

          setState(() {
            _isRejected = !isValid;
          });

          return isValid;
        },
        onAcceptWithDetails: (details) {
          setState(() {
            BlocProvider.of<FormBuilderBloc>(context).add(
              AddFormBuilderItemEvent(
                item: details.data,
                parentId: widget.parentId,
                parentContainerId: widget.parentContainerId,
                columnId: widget.columnId,
                columnIndex: widget.columnIndex,
              ),
            );
            _isObjectOver = false;
          });
        },
        onMove: (details) {
          setState(() {
            _isObjectOver = true;
          });
        },
        onLeave: (details) {
          setState(() {
            _isObjectOver = false;
            _isRejected = false;
          });
        },
        builder: (context, candidateData, rejectedData) {
          return DropZoneContainer(
            isObjectOver: _isObjectOver,
            isRejected: _isRejected,
            showExpaned: widget.showExpaned,
            columnIndex: widget.columnIndex,
          );
        },
      ),
      secondChild: SizedBox.shrink(),
    );
  }
}
