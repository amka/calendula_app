import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import 'pages/login.dart';
import 'pages/home.dart';
import 'pages/register.dart';
import 'providers/auth_provider.dart';

// This is crucial for making sure that the same navigator is used
// when rebuilding the GoRouter and not throwing away the whole widget tree.
final navigatorKey = GlobalKey<NavigatorState>();
Uri? initUrl = Uri.parse('/'); // needed to set intiial url state

final AuthProvider authProvider = Get.find();

final router = GoRouter(
  initialLocation: initUrl?.path, // DO NOT REMOVE
  navigatorKey: navigatorKey,
  redirect: (BuildContext context, GoRouterState state) async {
    // build initial path
    String? path = state.fullPath;
    
    log('initial path: "$path" ; initial auth: "${authProvider.isAuthenticated}"');
    if (!authProvider.isAuthenticated && !['/register','/login'].contains(state.fullPath)) {
      return '/login';
    } else {
      return null;
    }
  },
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      name: 'login',
      path: '/login',
      builder: (context, state) => LoginPage(),
    ),
    GoRoute(
      name: 'register',
      path: '/register',
      builder: (context, state) => RegisterPage(),
    ),
  ],
  debugLogDiagnostics: true,
);
