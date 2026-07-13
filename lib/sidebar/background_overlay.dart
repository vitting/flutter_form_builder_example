import 'package:flutter/material.dart';

class BackgroundOverlay extends StatelessWidget {
  final VoidCallback onTap;
  const BackgroundOverlay({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: 0.4),
        duration: const Duration(milliseconds: 250),
        curve: Curves.easeOutCubic,
        builder: (context, opacityValue, child) {
          return Opacity(
            opacity: opacityValue,
            child: Container(color: Colors.black),
          );
        },
      ),
    );
  }
}
