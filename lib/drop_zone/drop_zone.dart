import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_bloc.dart';
import 'package:flutter_form_builder_example/enums/control_types_enum.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

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

  Color get _getBackgroundColor {
    if (_isRejected) {
      return Colors.red.shade300;
    } else if (_isObjectOver) {
      return Colors.blue.shade800;
    } else if (widget.showExpaned) {
      return Colors.blue;
    } else {
      return Colors.grey.shade100;
    }
  }

  String get _getText {
    if (_isRejected) {
      return 'Cannot drop here';
    } else if (widget.columnIndex != null) {
      return 'Drop Control here in Column ${widget.columnIndex}';
    } else {
      return 'Drop Control here';
    }
  }

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
          return MouseRegion(
            cursor: _isRejected ? SystemMouseCursors.noDrop : SystemMouseCursors.click,
            child: AnimatedContainer(
              height: _isObjectOver || widget.showExpaned ? 60 : 10,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn,
              decoration: BoxDecoration(
                color: _getBackgroundColor,
                border: Border.all(color: _isObjectOver ? Colors.blue.shade900 : Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),

              width: double.infinity,

              child: Center(
                child: AnimatedDefaultTextStyle(
                  duration: Duration(milliseconds: 200),
                  curve: Curves.easeIn,
                  style: TextStyle(color: Colors.white, fontSize: _isObjectOver || widget.showExpaned ? 18 : 5),
                  child: Text(_getText),
                ),
              ),
            ),
          );
        },
      ),
      secondChild: SizedBox.shrink(),
    );
  }
}
