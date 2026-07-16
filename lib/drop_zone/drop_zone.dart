import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder_example/blocs/form_builder_bloc/form_builder_bloc.dart';
import 'package:flutter_form_builder_example/models/form_builder_item.dart';

class DropZone extends StatefulWidget {
  final String? parentId;
  final String? columnId;
  final bool showExpaned;
  final bool isVisible;
  const DropZone({super.key, this.parentId, this.showExpaned = false, this.isVisible = true, this.columnId});

  @override
  State<DropZone> createState() => _DropZoneState();
}

class _DropZoneState extends State<DropZone> {
  bool _isObjectOver = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      crossFadeState: widget.isVisible ? CrossFadeState.showFirst : CrossFadeState.showSecond,
      duration: Duration(milliseconds: 200),
      firstCurve: Curves.easeIn,
      firstChild: DragTarget<FormBuilderItem>(
        onAcceptWithDetails: (details) {
          setState(() {
            BlocProvider.of<FormBuilderBloc>(context).add(AddFormBuilderItemEvent(item: details.data, parentId: widget.parentId));
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
          });
        },
        builder: (context, candidateData, rejectedData) {
          return AnimatedContainer(
            height: _isObjectOver || widget.showExpaned ? 60 : 10,
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              color: _isObjectOver
                  ? Colors.blue.shade800
                  : widget.showExpaned
                  ? Colors.blue
                  : Colors.blue.shade100,
              border: Border.all(color: _isObjectOver ? Colors.blue.shade900 : Colors.blue),
              borderRadius: BorderRadius.circular(8),
            ),

            width: double.infinity,

            child: Center(
              child: AnimatedDefaultTextStyle(
                duration: Duration(milliseconds: 200),
                curve: Curves.easeIn,
                style: TextStyle(color: Colors.white, fontSize: _isObjectOver || widget.showExpaned ? 18 : 5),
                child: Text('Drop Control here'),
              ),
            ),
          );
        },
      ),
      secondChild: SizedBox.shrink(),
    );
  }
}
