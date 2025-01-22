// introduction_screen
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_color.dart';
import 'package:mata_online_market/core/constants/app_dimension.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/middle_text_widget.dart';
import 'package:mata_online_market/main.dart';

class IntroductionsScreen extends StatefulWidget {
  const IntroductionsScreen({super.key});

  @override
  IntroductionsScreenState createState() => IntroductionsScreenState();
}

class IntroductionsScreenState extends State<IntroductionsScreen> {
  final introKey = GlobalKey<IntroductionsScreenState>();

  void _onIntroEnd(context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (_) => const MyHomePage()),
    );
  }

  // Widget _buildFullscreenImage() {
  //   return Image.asset(
  //     'assets/fullscreen.jpg',
  //     fit: BoxFit.cover,
  //     height: double.infinity,
  //     width: double.infinity,
  //     alignment: Alignment.center,
  //   );
  // }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/$assetName', width: width);
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
      infiniteAutoScroll: false,
      globalHeader: Align(
        alignment: Alignment.topRight,
        child: SafeArea(
          child: Padding(
            padding: AppSpacing.screenPadding,
            child: _buildImage('flutter.png', 100),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          title: "Täze matalaryň dünýäsi – indi barysy elýeter!",
          body:
              "Täze matalaryň dünýäsi sizi garşylaýar! Hiline we gözelligine kepil geçilýän matalar indi barysy elýeter we öýüňizden çykman sargyt edip bilersiňiz.",
          image: _buildImage('img1.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Hil we amatly bahalar bilelikde!",
          body:
              "Müşderilerimiziň isleglerini kanagatlandyrmak üçin, hil taýdan ýokary bolan matalary amatly bahalardan hödürleýäris.",
          image: _buildImage('img2.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title:
              "Toý sadakasy ýa-da gündelik durmuş – hemme zat üçin laýyk matalar!",
          body:
              "Toý sadakalary ýa-da gündelik durmuş üçin gerek bolan ähli matalaryny taparsyňyz. Islendik çärä laýyk görnüşler we reňkler elýeter.",
          image: _buildImage('img3.jpg'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Öz stiliňi tap – indi matalaryň täze mümkinçilikleri!",
          body:
              "Matalarymyz arkaly özboluşly stil dörediň. Ýokary hilli we giň görnüşler bilen arzuwlaryňyzy amala aşyryň.",
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
      back: const Icon(
        AppIcons.arrowBack,
        color: AppColors.whiteThemeText,
      ),
      skip: const MiddleTextWidget(text: 'Skip'),
      next: const Icon(
        AppIcons.arrowForword,
        color: AppColors.whiteThemeText,
      ),
      done: const MiddleTextWidget(text: 'Done'),
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
