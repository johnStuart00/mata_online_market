import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/features/home_screen/presentation/home_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = _SelectedTab.values[i];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: IndexedStack(
        index: _SelectedTab.values.indexOf(_selectedTab),
        children: const [
          HomeScreen(),
          Center(child: Text('Favorite Page')),
          Center(child: Text('Shop Card Page')),
          Center(child: Text('Profile Page')),
        ],
      ),
      bottomNavigationBar: SizedBox(
        height: 130,
        width: double.infinity,
        child: DotNavigationBar(
          backgroundColor:
              Theme.of(context).bottomNavigationBarTheme.backgroundColor,
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          dotIndicatorColor: Theme.of(context).iconTheme.color,
          unselectedItemColor: Colors.grey[300],
          selectedItemColor: Theme.of(context).iconTheme.color,
          splashBorderRadius: 50,
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Theme.of(context).shadowColor.withOpacity(0.3),
              blurRadius: 8,
              spreadRadius: 0.5,
              offset: const Offset(0, 2),
            ),
          ],
          // enableFloatingNavBar: false,
          onTap: _handleIndexChanged,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: const Icon(AppIcons.home),
            ),

            /// Likes
            DotNavigationBarItem(
              icon: const Icon(AppIcons.likes),
            ),

            /// Search
            DotNavigationBarItem(
              icon: const Icon(AppIcons.shopCard),
            ),

            /// Profile
            DotNavigationBarItem(
              icon: const Icon(AppIcons.user),
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, favorite, shopCard, person }
