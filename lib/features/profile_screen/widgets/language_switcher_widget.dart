import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:get/get.dart';

class LanguageSwitcher extends StatefulWidget {
  const LanguageSwitcher({super.key});

  @override
  State<LanguageSwitcher> createState() => _LanguageSwitcherState();
}

class _LanguageSwitcherState extends State<LanguageSwitcher> {
  bool isRussian = false; // Default language state

  @override
  void initState() {
    super.initState();
    _loadLanguagePreference();
  }

  Future<void> _loadLanguagePreference() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      isRussian = prefs.getString('selected_language') == 'en';
    });
  }

  Future<void> _saveLanguagePreference(bool isEnglishSelected) async {
    final prefs = await SharedPreferences.getInstance();
    final languageCode = isEnglishSelected ? 'en' : 'tr';
    await prefs.setString('selected_language', languageCode);

    // Change app locale immediately using GetX
    Get.updateLocale(Locale(languageCode));
  }

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: isRussian,
      activeColor: Theme.of(context).iconTheme.color,
      onChanged: (bool value) {
        setState(() {
          isRussian = value;
        });
        _saveLanguagePreference(value);
      },
    );
  }
}
