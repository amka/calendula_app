import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';

class ResponsiveNavRail extends StatelessWidget {
  const ResponsiveNavRail({
    super.key,
    required this.selectedIndex,
    this.onPageChanged,
  });

  final int selectedIndex;
  final Function(int)? onPageChanged;

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width > 600
        ? Column(
            children: [
              Expanded(
                child: NavigationRail(
                  extended: MediaQuery.of(context).size.width > 800,
                  selectedIndex: selectedIndex,
                  onDestinationSelected: onPageChanged,
                  destinations: const [
                    NavigationRailDestination(
                      icon: Icon(
                        TablerIcons.smart_home,
                      ),
                      label: Text('Tasks'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        TablerIcons.calendar_month,
                      ),
                      label: Text('Calendar'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        TablerIcons.chart_pie,
                      ),
                      label: Text('Activity'),
                    ),
                    NavigationRailDestination(
                      icon: Icon(
                        TablerIcons.user,
                      ),
                      label: Text('Profile'),
                    ),
                  ],
                ),
              ),
            ],
          )
        : const SizedBox.shrink();
  }
}
