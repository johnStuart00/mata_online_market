import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mata_online_market/config/theme/app_theme.dart';
import 'package:mata_online_market/config/routes/route_helper.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<String>('searchHistory');
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(OnlineMataMarket(
    savedThemeMode: savedThemeMode,
  ));
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
        initialRoute: RouteHelper.getIntroductionScreen(),
        getPages: RouteHelper.routes,
      ),
    );
  }
}
