import 'package:flutter/material.dart';

class AppBottomNavBar extends StatelessWidget {
  const AppBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 1.0,
            spreadRadius: 1.0,
            offset: const Offset(0.0, 1.0),
          )
        ],
      ),
      child: NavigationBarTheme(
        data: NavigationBarThemeData(
          labelTextStyle: MaterialStatePropertyAll(
            Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: const Color(0xFFD5354C),
                ),
          ),
        ),
        child: NavigationBar(
          labelBehavior: NavigationDestinationLabelBehavior.alwaysShow,
          onDestinationSelected: (int index) {},
          indicatorColor: Colors.transparent,
          selectedIndex: 0,
          height: 56.0,
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.search_outlined),
              label: 'Explore',
              selectedIcon: Icon(Icons.search, color: Color(0xFFD5354C)),
            ),
            NavigationDestination(
              icon: Icon(Icons.favorite_border_outlined),
              label: 'Wishlist',
              selectedIcon: Icon(Icons.favorite, color: Color(0xFFD5354C)),
            ),
            NavigationDestination(
              icon: Icon(Icons.wb_sunny_outlined),
              label: 'Trips',
              selectedIcon: Icon(Icons.wb_sunny, color: Color(0xFFD5354C)),
            ),
            NavigationDestination(
              icon: Icon(Icons.message_outlined),
              label: 'Inbox',
              selectedIcon: Icon(Icons.message, color: Color(0xFFD5354C)),
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outline),
              label: 'Log in',
              selectedIcon: Icon(Icons.person, color: Color(0xFFD5354C)),
            ),
          ],
        ),
      ),
    );
  }
}
