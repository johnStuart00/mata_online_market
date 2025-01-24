import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';

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
      body: Center(
        child: Text(AppLocalizations.of(context)!.tazeMatalarDunyasi),
      ),
      bottomNavigationBar: SizedBox(
        height: 130,
        width: double.infinity,
        child: DotNavigationBar(
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          dotIndicatorColor: Theme.of(context).iconTheme.color,
          unselectedItemColor: Colors.grey[300],
          splashBorderRadius: 50,
          // enableFloatingNavBar: false,
          onTap: _handleIndexChanged,
          items: [
            /// Home
            DotNavigationBarItem(
              icon: const Icon(AppIcons.home),
              selectedColor: Theme.of(context).iconTheme.color,
            ),

            /// Likes
            DotNavigationBarItem(
              icon: const Icon(AppIcons.likes),
              selectedColor: Theme.of(context).iconTheme.color,
            ),

            /// Search
            DotNavigationBarItem(
              icon: const Icon(AppIcons.shopCard),
              selectedColor: Theme.of(context).iconTheme.color,
            ),

            /// Profile
            DotNavigationBarItem(
              icon: const Icon(AppIcons.user),
              selectedColor: Theme.of(context).iconTheme.color,
            ),
          ],
        ),
      ),
    );
  }
}

enum _SelectedTab { home, favorite, shopCard, person }
