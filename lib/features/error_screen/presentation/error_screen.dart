import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mata_online_market/core/assets/app_images.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(AssetsPath().errorLottiePath),
            const SizedBox(height: 15),
            MiddleTextWidget(
                text:
                    '${AppLocalizations.of(context)!.serwereBaglanypBilmedi} \n ${AppLocalizations.of(context)!.internetiniziBarlan}'),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: MiddleTextWidget(
                  text: AppLocalizations.of(context)!.tazedenSynansyn),
            )
          ],
        ),
      ),
    );
  }
}
