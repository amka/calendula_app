import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../providers/auth_provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AuthProvider authProvider = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.person_4_rounded,
          ),
          onPressed: () {
            authProvider.logout();
            context.goNamed('login');
          },
        ),
      ),
      body: Center(
        child: Text('Welcome Home'),
      ),
    );
  }
}
