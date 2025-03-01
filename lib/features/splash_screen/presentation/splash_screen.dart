import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/core/constants/app_dimension.dart';
import 'package:mata_online_market/core/widgets/middle_text_widget.dart';
import 'package:mata_online_market/features/introduction_screen/presentation/introduction_screen.dart';
import 'package:mata_online_market/features/main_screen/presentation/main_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool? hasSeenIntro;

  Future<void> _checkIfIntroSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = prefs.getBool('hasSeenIntro') ?? false;

    setState(() {
      hasSeenIntro = seen;
    });
  }

  @override
  void initState() {
    super.initState();
    _checkIfIntroSeen();
  }

  get splash => null;

  @override
  Widget build(BuildContext context) {
    if (hasSeenIntro == null) {
      return Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    return AnimatedSplashScreen(
      splash: const SplashWidget(),
      nextScreen:
          hasSeenIntro! ? const MyHomePage() : const IntroductionsScreen(),
      animationDuration: const Duration(seconds: 5),
      splashIconSize: AppDimensions.screenHeight(context),
      splashTransition: SplashTransition.fadeTransition,
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}

class SplashWidget extends StatelessWidget {
  const SplashWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Center(
              child: Image.asset(
                'assets/logo/sapamata.png',
                width: AppDimensions.setWidth(context, 0.5),
              ),
            ),
          ),
          const Expanded(flex: 1, child: MiddleTextWidget(text: 'Sapa Mata'))
        ],
      ),
    );
  }
}
