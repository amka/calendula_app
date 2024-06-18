import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../providers/app_state.dart';
import '../providers/auth_provider.dart';
import '../widgets/bottom_navbar.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final AppState appState = Get.find();
  final AuthProvider authProvider = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.person_4_rounded,
          ),
          onPressed: () {
            authProvider.logout();
            context.goNamed('login');
          },
        ),
      ),
      body: const Center(
        child: Text('Welcome Home'),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavBar(
          selectedIndex: appState.currentPage.value,
          onPageChanged: (pageIndex) => appState.currentPage.value = pageIndex,
        ),
      ),
    );
  }
}
