import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mata_online_market/config/theme/app_theme.dart';
import 'package:mata_online_market/config/routes/route_helper.dart';
import 'package:mata_online_market/features/error_screen/presentation/error_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('searchHistory');
  final savedThemeMode = await _loadThemeMode();
  runApp(OnlineMataMarket(
    savedThemeMode: savedThemeMode,
  ));
}

Future<AdaptiveThemeMode> _loadThemeMode() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool isDark = prefs.getBool('isDark') ?? false;
  return isDark ? AdaptiveThemeMode.dark : AdaptiveThemeMode.light;
}

class OnlineMataMarket extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;
  const OnlineMataMarket({super.key, this.savedThemeMode});

  @override
  State<OnlineMataMarket> createState() => _OnlineMataMarketState();
}

class _OnlineMataMarketState extends State<OnlineMataMarket> {
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: AppThemes.lightTheme,
      dark: AppThemes.darkTheme,
      initial: widget.savedThemeMode ?? AdaptiveThemeMode.system,
      builder: (theme, darkTheme) => GetMaterialApp(
        //debugShowCheckedModeBanner: false,
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: theme,
        darkTheme: darkTheme,
        initialRoute: RouteHelper.splashScreen,
        getPages: RouteHelper.routes,
        onGenerateRoute: (RouteSettings settings) {
          return MaterialPageRoute<void>(builder: (context) {
            return const ErrorPage();
          });
        },
      ),
    );
  }
}
