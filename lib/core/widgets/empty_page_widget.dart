import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mata_online_market/core/assets/app_images.dart';
import 'package:mata_online_market/core/widgets/middle_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class EmptyPageWidget extends StatelessWidget {
  const EmptyPageWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            AssetsPath().emptyLottiePath,
            width: 200,
            height: 200,
            fit: BoxFit.contain,
          ),
          const SizedBox(height: 10),
          MiddleTextWidget(
            text: AppLocalizations.of(context)!.gynansakdaHarytTapylmady,
          ),
        ],
      ),
    );
  }
}
