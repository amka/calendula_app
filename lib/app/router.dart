import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import 'pages/login_page.dart';
import 'pages/splash.dart';
import 'package:go_router/go_router.dart';
import 'providers/auth_provider.dart';

// This is crucial for making sure that the same navigator is used
// when rebuilding the GoRouter and not throwing away the whole widget tree.
final navigatorKey = GlobalKey<NavigatorState>();
Uri? initUrl = Uri.base; // needed to set intiial url state

final AuthProvider authProvider = Get.find();

final router = GoRouter(
  initialLocation: initUrl?.path, // DO NOT REMOVE
  navigatorKey: navigatorKey,
  redirect: (context, state) async {
    // build initial path
    String? path = initUrl?.path;
    final queryString = initUrl?.query.trim() ?? "";
    if (queryString.isNotEmpty && path != null) {
      path += "?$queryString";
    }

    // If user is not authenticated, direct to login screen
    if (!authProvider.isAuthenticated && initUrl?.path != '/login') {
      return '/login';
    }

    // If user is authenticated and trying to access login or loading, direct to home
    if (authProvider.isAuthenticated && initUrl?.path == '/login') {
      return '/';
    }

    // After handling initial redirection, clear initUrl to prevent repeated redirections
    initUrl = null;
    return path;
  },
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) {
        return const LoginPage();
      },
    ),
  ],
);
