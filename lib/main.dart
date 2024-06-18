import 'package:calendula_app/app/providers/app_state.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pocketbase/pocketbase.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app/app_config.dart';
import 'app/providers/auth_provider.dart';
import 'app/router.dart';
import 'app/theme/default.dart' as light;
import 'app/theme/default_dark.dart' as dark;

Future<void> main() async {
  usePathUrlStrategy();
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
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: light.colorScheme.onSurface,
          displayColor: light.colorScheme.onSurface,
        ),
      ),
      darkTheme: ThemeData(
        colorScheme: dark.colorScheme,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: dark.colorScheme.surface,
        canvasColor: dark.colorScheme.onSurface,
        textTheme: GoogleFonts.interTextTheme().apply(
          bodyColor: dark.colorScheme.onSurface,
          displayColor: dark.colorScheme.onSurface,
        ),
      ),
      builder: (context, child) => Container(child: child),
    );
  }
}

Future<void> initServices() async {
  // await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();

  final store = AsyncAuthStore(
    save: (String data) async => prefs.setString('pb_auth', data),
    initial: prefs.getString('pb_auth'),
  );

  final pocketBase = PocketBase(
    AppConfig.baseApiUrl,
    authStore: store,
  );

  Get.put(AppState());
  Get.put(AuthProvider(pocketBase: pocketBase));
}
