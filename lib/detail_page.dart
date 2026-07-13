import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellow,
      child: Column(children: [Center(child: Text('Detail Page for item $id'))]),
    );
  }
}
