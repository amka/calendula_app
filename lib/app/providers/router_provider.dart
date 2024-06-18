import 'package:calendula_app/app/pages/splash.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// This is crucial for making sure that the same navigator is used
// when rebuilding the GoRouter and not throwing away the whole widget tree.
final navigatorKey = GlobalKey<NavigatorState>();
Uri? initUrl = Uri.base; // needed to set intiial url state

GoRouter router(ref) {
  // final authState = ref.watch(authProvider);
  return GoRouter(
    initialLocation: initUrl?.path, // DO NOT REMOVE
    navigatorKey: navigatorKey,
    routes: [
      GoRoute(
        name: 'loading',
        path: '/loading',
        builder: (context, state) => const SplashPage(),
      ),
    ],
  );
}
