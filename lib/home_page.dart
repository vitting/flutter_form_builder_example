import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/form_builder/form_builder.dart';
import 'package:flutter_form_builder_example/web_scaffold.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blue),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                await metaSidebarController.show(Text('Hello'));
              },
              child: Text('Show Meta Sidebar'),
            ),
            Expanded(child: FormBuilder()),
          ],
        ),
      ),
    );
  }
}
