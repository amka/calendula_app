import 'package:calendula_app/app/widgets/responsive_bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';

import '../providers/app_state.dart';
import '../providers/auth_provider.dart';
import '../widgets/bottom_navbar.dart';
import '../widgets/responsive_navrails.dart';

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
      body: Row(
        children: [
          Obx(
            () => ResponsiveNavRail(
              selectedIndex: appState.currentPage.value,
              onPageChanged: (pageIndex) =>
                  appState.currentPage.value = pageIndex,
            ),
          ),
          const Expanded(
            child: Center(
              child: Text('Welcome Home'),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Obx(
        () => ResponsiveBottomNavbar(
          selectedIndex: appState.currentPage.value,
          onPageChanged: (pageIndex) => appState.currentPage.value = pageIndex,
        ),
      ),
    );
  }
}
