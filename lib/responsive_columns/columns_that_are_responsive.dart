import 'package:flutter/material.dart';

class ColumnsThatAreResponsive extends StatelessWidget {
  final double breakpoint;
  final List<Widget> columns;
  final List<int> flexColumns;
  final double verticalSpacing;
  final double horizontalSpacing;

  const ColumnsThatAreResponsive({
    super.key,
    this.breakpoint = 700,

    required this.columns,
    this.flexColumns = const [],
    this.verticalSpacing = 16,
    this.horizontalSpacing = 16,
  });

  List<Widget> _columnsHorizontal(List<Widget> cols) {
    final List<Widget> generatedColumns = [];

    for (int i = 0; i < cols.length; i++) {
      int flex = 1;

      if (flexColumns.isNotEmpty && columns.length == flexColumns.length) {
        flex = flexColumns[i];
      }

      if (i > 0) generatedColumns.add(SizedBox(width: horizontalSpacing));
      generatedColumns.add(
        Expanded(
          flex: flex,
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [cols[i]]),
        ),
      );
    }

    return generatedColumns;
  }

  List<Widget> _columnsVertical(List<Widget> cols) {
    final List<Widget> generatedColumns = [];
    for (int i = 0; i < cols.length; i++) {
      generatedColumns.add(cols[i]);
      if (i != cols.length - 1) {
        generatedColumns.add(SizedBox(height: verticalSpacing));
      }
    }

    return generatedColumns;
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > breakpoint) {
          return Row(crossAxisAlignment: CrossAxisAlignment.start, children: _columnsHorizontal(columns));
        } else {
          return Column(mainAxisAlignment: MainAxisAlignment.start, children: _columnsVertical(columns));
        }
      },
    );
  }
}
