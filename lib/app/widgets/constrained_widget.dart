import 'package:flutter/material.dart';

class ConstrainedWidget extends StatelessWidget {
  const ConstrainedWidget({
    super.key,
    required this.child,
    this.maxWidth = 360,
  });

  final Widget child;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: child,
      ),
    );
  }
}
