import 'package:ed_zod/screens/dashboard_screen/bottom_navbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _selectedIndex = 0;
  // int _previousIndex = 0;

  // final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  void _goToBranch(int index) {
    widget.navigationShell.goBranch(index,
        initialLocation: index == widget.navigationShell.currentIndex);
  }

  void _onItemTapped(int index) {
    setState(() {
      // _previousIndex = _selectedIndex;
      _selectedIndex = index;
    });
    _goToBranch(_selectedIndex);
  }

  // onBack() {
  //   _onItemTapped(_previousIndex);
  //   // _navigatorKey.currentState!.popUntil((route) => route.isFirst);
  //   _navigatorKey.currentState!.pop();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.navigationShell,
      bottomNavigationBar: BottomNavigationBarWidget(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
            ),
    );
  }
}
