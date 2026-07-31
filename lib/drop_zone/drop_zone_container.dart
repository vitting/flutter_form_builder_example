import 'package:flutter/material.dart';

class DropZoneContainer extends StatelessWidget {
  final bool isObjectOver;
  final bool isRejected;
  final bool showExpaned;
  final int? columnIndex;
  const DropZoneContainer({
    super.key,
    required this.isObjectOver,
    required this.isRejected,
    required this.showExpaned,
    this.columnIndex,
  });

  Color get _getBackgroundColor {
    if (isRejected) {
      return Colors.red.shade300;
    } else if (isObjectOver) {
      return Colors.blue.shade800;
    } else if (showExpaned) {
      return Colors.blue;
    } else {
      return Colors.grey.shade100;
    }
  }

  String get _getText {
    if (isRejected) {
      return 'Cannot drop here';
    } else if (columnIndex != null) {
      return 'Drop Control here in Column $columnIndex';
    } else {
      return 'Drop Control here';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: isRejected ? SystemMouseCursors.noDrop : SystemMouseCursors.click,
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(horizontal: 8),
        height: isObjectOver || showExpaned ? 60 : 10,
        duration: Duration(milliseconds: 200),
        curve: Curves.easeIn,
        decoration: BoxDecoration(
          color: _getBackgroundColor,
          border: Border.all(color: isObjectOver ? Colors.blue.shade900 : Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),

        width: double.infinity,

        child: Center(
          child: AnimatedDefaultTextStyle(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeIn,
            style: TextStyle(color: Colors.white, fontSize: isObjectOver || showExpaned ? 18 : 5),
            child: Text(_getText),
          ),
        ),
      ),
    );
  }
}
