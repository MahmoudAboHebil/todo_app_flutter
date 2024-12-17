import 'package:flutter/material.dart';

class CircleContainer extends StatelessWidget {
  const CircleContainer(
      {required this.backgroundColor,
      required this.borderColor,
      this.child,
      super.key});
  final Color backgroundColor;
  final Color borderColor;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(9.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: backgroundColor,
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Center(child: child),
    );
  }
}
