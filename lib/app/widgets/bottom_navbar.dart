import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.selectedIndex,
    this.onPageChanged,
  });

  final int selectedIndex;
  final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      selectedIndex: selectedIndex,
      onDestinationSelected: onPageChanged,
      destinations: const [
        NavigationDestination(
          icon: Icon(
            TablerIcons.smart_home,
          ),
          label: 'Tasks',
        ),
        NavigationDestination(
          icon: Icon(
            TablerIcons.calendar_month,
          ),
          label: 'Calendar',
        ),
        NavigationDestination(
          icon: Icon(
            TablerIcons.chart_pie,
          ),
          label: 'Activity',
        ),
        NavigationDestination(
          icon: Icon(
            TablerIcons.user,
          ),
          label: 'Profile',
        ),
      ],
    );
  }
}
