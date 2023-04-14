import 'package:flutter/material.dart';
class BottomNavBAr extends StatelessWidget {
  const BottomNavBAr({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      selectedItemColor: Colors.black,
      showUnselectedLabels: true,
      unselectedItemColor: Colors.grey,
      type: BottomNavigationBarType.fixed, // Fixed
      backgroundColor: Colors.white,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.insert_page_break_outlined),label: 'Records',),
        BottomNavigationBarItem(icon: Icon(Icons.analytics), label: 'Analytics'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: 'Bugdet'),
        BottomNavigationBarItem(icon: Icon(Icons.settings_applications_outlined), label: 'Settings'),
      ],
    );
  }
}