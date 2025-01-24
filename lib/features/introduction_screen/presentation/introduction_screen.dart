// introduction_screen
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/assets/app_images.dart';
import 'package:mata_online_market/core/constants/app_color.dart';
import 'package:mata_online_market/core/constants/app_dimension.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/middle_text_widget.dart';
import 'package:mata_online_market/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IntroductionsScreen extends StatefulWidget {
  const IntroductionsScreen({super.key});

  @override
  IntroductionsScreenState createState() => IntroductionsScreenState();
}

class IntroductionsScreenState extends State<IntroductionsScreen> {
  final introKey = GlobalKey<IntroductionsScreenState>();
  final assetsPath = AssetsPath();
  String selectedLanguage = 'Türkmen';
  bool _autoScrollEnabled = false;

  // Widget _buildImage(String assetName, [double width = 350]) {
  //   return Image.asset('assets/$assetName', width: width);
  // }

  void _onIntroEnd(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenIntro', true);

    Get.offAll(() => const MyHomePage());
  }

  Future<void> _checkIfIntroSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool hasSeenIntro = prefs.getBool('hasSeenIntro') ?? false;

    if (hasSeenIntro) {
      Get.offAll(() => const MyHomePage());
    }
  }

  @override
  void initState() {
    super.initState();
    _loadLanguage();
    _checkIfIntroSeen();
  }

  Future<void> _loadLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    selectedLanguage = prefs.getString('selectedLanguage') ?? 'Türkmen';
    if (prefs.getBool('isLanguageSelected') ?? true) {
      _showLanguageSelectionDialog();
    } else {
      _setAppLocale(selectedLanguage);
    }
  }

  void _setAppLocale(String language) {
    Locale locale;
    if (language == 'Türkmen') {
      locale = const Locale('tr');
    } else {
      locale = const Locale('ru');
    }
    Get.updateLocale(locale);
  }

  Future<void> _showLanguageSelectionDialog() async {
    List<String> languages = ['Türkmen', 'Русский'];
    int selectedIndex = 0;

    await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog(
          title: const MiddleTextWidget(text: 'Dil saýlaň / Выберите язык'),
          content: SizedBox(
            height: 150,
            child: ListWheelScrollView(
              itemExtent: 50,
              perspective: 0.01,
              diameterRatio: 2.5,
              onSelectedItemChanged: (index) {
                selectedIndex = index;
              },
              children: languages.asMap().entries.map((entry) {
                int index = entry.key;
                String lang = entry.value;
                String iconPath =
                    index == 0 ? assetsPath.tkmIcon : assetsPath.rusIcon;
                return Center(
                    child: Row(
                  children: [
                    Image.asset(iconPath),
                    const SizedBox(width: 10),
                    MiddleTextWidget(text: lang),
                  ],
                ));
              }).toList(),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () async {
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.setBool('isLanguageSelected', true);
                prefs.setString('selectedLanguage', languages[selectedIndex]);

                setState(() {
                  selectedLanguage = languages[selectedIndex];
                  _setAppLocale(selectedLanguage);
                  _autoScrollEnabled = true;
                });

                Get.back();

                Get.snackbar(
                  AppLocalizations.of(context)!.dilSaylandy,
                  '${AppLocalizations.of(context)!.dilSaylandy} ${languages[selectedIndex]}',
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: const MiddleTextWidget(text: 'OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const bodyStyle = TextStyle(fontSize: 19.0);

    final pageDecoration = PageDecoration(
      titleTextStyle:
          const TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700),
      bodyTextStyle: bodyStyle,
      bodyPadding: AppSpacing.screenPadding,
      pageColor: Theme.of(context).scaffoldBackgroundColor,
      imagePadding: EdgeInsets.zero,
    );

    return IntroductionScreen(
      bodyPadding: AppSpacing.screenPadding,
      key: introKey,
      globalBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
      allowImplicitScrolling: true,
      autoScrollDuration: 5000,
      infiniteAutoScroll: _autoScrollEnabled,
      globalHeader: const Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: AppSpacing.screenPadding,
            //child: _buildImage('flutter.png', 100),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: AppLocalizations.of(context)!.tazeMatalarDunyasi,
          body: AppLocalizations.of(context)!.tazeMatalarDunyasiTitle,
          //image: _buildImage('img1.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.hilWeAmatlyBaha,
          body: AppLocalizations.of(context)!.hilWeAmatlyBahaTitle,
          //image: _buildImage('img2.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.toySadakaYadaGundelikDurmus,
          body: AppLocalizations.of(context)!.toySadakaYadaGundelikDurmusTitle,
          //image: _buildImage('img3.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: AppLocalizations.of(context)!.ozStiliniTap,
          body: AppLocalizations.of(context)!.ozStiliniTapTitle,
          decoration: pageDecoration.copyWith(
            contentMargin: const EdgeInsets.symmetric(horizontal: 16),
            fullScreen: true,
            bodyFlex: 2,
            imageFlex: 3,
            safeArea: 100,
          ),
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      showSkipButton: true,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: false,
      back: Icon(AppIcons.arrowBack, color: Theme.of(context).iconTheme.color),
      skip: MiddleTextWidget(text: AppLocalizations.of(context)!.gec),
      next:
          Icon(AppIcons.arrowForword, color: Theme.of(context).iconTheme.color),
      done: MiddleTextWidget(text: AppLocalizations.of(context)!.tamam),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: AppSpacing.cardPadding,
      dotsDecorator: const DotsDecorator(
        size: AppDimensions.dotsSize,
        color: AppColors.whiteThemeText,
        activeSize: AppDimensions.dotsActiveSize,
        activeColor: AppColors.whiteThemeBack,
        activeShape: RoundedRectangleBorder(
          borderRadius: AppSpacing.dotsRadius,
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: AppColors.whiteThemeContainer,
        shape: RoundedRectangleBorder(
          borderRadius: AppSpacing.cardRadius,
        ),
      ),
    );
  }
}
