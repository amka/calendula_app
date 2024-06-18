import 'package:flutter/material.dart';

import 'bottom_navbar.dart';

class ResponsiveBottomNavbar extends StatelessWidget {
  const ResponsiveBottomNavbar({
    super.key,
    required this.selectedIndex,
    this.onPageChanged,
  });

  final int selectedIndex;
  final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 600
        ? BottomNavBar(
            selectedIndex: selectedIndex,
            onPageChanged: onPageChanged,
          )
        : const SizedBox.shrink();
  }
}
