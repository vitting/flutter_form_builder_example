import 'package:flutter/material.dart';

class Topbar extends StatelessWidget {
  const Topbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 80,
                  color: Colors.red,
                  child: Row(
                    children: [
                      const SizedBox(width: 12),
                      const Text(
                        'Topbar',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
