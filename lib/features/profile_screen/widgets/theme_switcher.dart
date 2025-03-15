import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
// import 'package:mata_online_market/core/assets/app_images.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeModeSwitcher extends StatefulWidget {
  const ThemeModeSwitcher({super.key});

  @override
  State<ThemeModeSwitcher> createState() => ThemeModeSwitcherState();
}

class ThemeModeSwitcherState extends State<ThemeModeSwitcher> {
  bool _isDark = false;

  _loadThemeMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _isDark =
          prefs.getBool('isDark') ?? false; // Default is false (light mode)
    });
  }

  _saveThemeMode(bool isDark) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDark', isDark);
  }

  @override
  void initState() {
    super.initState();
    _loadThemeMode();
  }

  @override
  Widget build(BuildContext context) {
    bool isDark = _isDark;

    return Switch(
      value: isDark,
      // activeThumbImage: AssetImage(AssetsPath().nightImagePath),
      // inactiveThumbImage: AssetImage(AssetsPath().dayImagePath),
      activeColor: Theme.of(context).iconTheme.color,
      onChanged: (bool value) {
        setState(() {
          _isDark = value;
        });

        _saveThemeMode(value);

        if (value) {
          AdaptiveTheme.of(context).setDark();
        } else {
          AdaptiveTheme.of(context).setLight();
        }
      },
    );
  }
}
