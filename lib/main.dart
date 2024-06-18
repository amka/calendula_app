import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app/router.dart';
import 'app/theme/default.dart' as light;
import 'app/theme/default_dark.dart' as dark;

void main() {
  runApp(const ProviderScope(child: CalendulaApp()));
}

class CalendulaApp extends StatelessWidget {
  const CalendulaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Calendula',
      routerConfig: router,
      theme: ThemeData(
        colorScheme: light.colorScheme,
        brightness: Brightness.light,
        scaffoldBackgroundColor: light.colorScheme.surface,
        canvasColor: light.colorScheme.onSurface,
        textTheme: GoogleFonts.interTextTheme(),
      ),
      darkTheme: ThemeData(
        colorScheme: dark.colorScheme,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: dark.colorScheme.surface,
        canvasColor: dark.colorScheme.onSurface,
        // textTheme: GoogleFonts.interTextTheme(),
      ),
    );
  }
}
