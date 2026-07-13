import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/web_scaffold.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text('List Page', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text('Right-click or Ctrl+click any item to open in a new tab.'),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () async {
            await sidebarController.show(Text('This is the sidebar content. You can put any widget here.'));
            debugPrint('**********Sidebar closed');
          },
          child: const Text('Show Sidebar'),
        ),
      ],
    );
  }
}
