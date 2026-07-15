import 'package:flutter/material.dart';
import 'package:flutter_form_builder_example/control_types_enum.dart';
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
      color: Colors.grey.shade200,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DragTarget<ControlTypesEnum>(
            // onWillAcceptWithDetails: (details) => details.data != caughtColor,
            onAcceptWithDetails: (details) {
              debugPrint('Dropped color: ${details.data}');
              setState(() {
                // caughtColor = details.data; // Capture payload data on drop
              });
            },
            builder: (context, candidateData, rejectedData) {
              return Container(
                color: Colors.red.shade300,
                width: double.infinity,
                height: 200,
                child: const Center(
                  child: Text('Drop here', style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              );
            },
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: () async {
              await sidebarController.show(
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: 30,
                  itemBuilder: (context, index) {
                    return Material(
                      child: ListTile(
                        title: Text('Item $index'),
                        onTap: () {
                          debugPrint('Tapped item $index');
                        },
                      ),
                    );
                  },
                ),
                canBeResized: true,
              );
              debugPrint('**********Sidebar closed');
            },
            child: const Text('Show Sidebar'),
          ),
        ],
      ),
    );
  }
}
