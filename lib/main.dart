import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocketbase/pocketbase.dart';

import 'app/app_config.dart';
import 'app/providers/auth_provider.dart';
import 'app/router.dart';
import 'app/theme/default.dart' as light;
import 'app/theme/default_dark.dart' as dark;

Future<void> main() async {
  // Init services with GetX
  await initServices();

  runApp(const CalendulaApp());
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

Future<void> initServices() async {
  // await Firebase.initializeApp();
  final pocketBase = PocketBase(AppConfig.baseApiUrl);

  Get.put(AuthProvider(pocketBase: pocketBase));
}
