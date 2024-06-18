import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../extensions/context.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GradientText(
              'Calendula',
              style: const TextStyle(fontSize: 48),
              colors: [
                context.colorScheme.primary,
                context.colorScheme.secondary,
              ],
            ),
            Text('Leave planning to us', style: context.textTheme.bodyLarge),
          ],
        ),
      ),
    );
  }
}
