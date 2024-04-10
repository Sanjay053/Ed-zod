import 'package:ed_zod/utils/constants/app_colors.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarWidget extends StatefulWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;
  

  const BottomNavigationBarWidget({super.key, 
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  State<BottomNavigationBarWidget> createState() => _BottomNavigationBarWidgetState();
}

class _BottomNavigationBarWidgetState extends State<BottomNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items:   <BottomNavigationBarItem>[
        const BottomNavigationBarItem(
          icon: Icon(Icons.menu_book_sharp),
          label: 'Course',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.work_rounded),
          label: 'Jobs',
        ),
        const BottomNavigationBarItem(
          icon: Icon(Icons.now_widgets_outlined),
          label: 'Products',
        ),
        BottomNavigationBarItem(
          icon: CircleAvatar(
                child: Image.asset(
                  'assets/images/profile-img.png',
                ),
              ),
          label: 'Profile',
        ),
      ],
      currentIndex: widget.selectedIndex,
      selectedIconTheme: IconThemeData(color: myLogoBackgroundColor),
      showUnselectedLabels: true,
      selectedItemColor: myLogoBackgroundColor,
      unselectedItemColor: myNavUnSelectedGrayColor,
      onTap: widget.onItemTapped,
    );
  }
}
