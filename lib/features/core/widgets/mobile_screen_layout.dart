import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pic_connect/utils/colors.dart';

class MobileScreenLayout extends StatelessWidget {

  final StatefulNavigationShell navigationShell;

  const MobileScreenLayout({
    required this.navigationShell,
    Key? key,
  }) : super(key: key ?? const ValueKey<String>('MobileScreenLayout'));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        currentIndex: navigationShell.currentIndex,
        onTap: (int tappedIndex) {
          navigationShell.goBranch(tappedIndex);
        },
        activeColor: secondaryColor,
        inactiveColor: accentColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              label: 'Add'),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile'
          ),
        ]
      ),
    );
  }
}