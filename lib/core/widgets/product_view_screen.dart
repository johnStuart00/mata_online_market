import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/config/routes/route_helper.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/widgets/middle_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  final List<String> products = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //AppBar field start
          SliverAppBar(
            pinned: true,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: MiddleTextWidget(
              text: AppLocalizations.of(context)!.harytMaglumatlary,
            ),
            leading: GestureDetector(
              onTap: () {
                Get.back();
              },
              child: const Icon(AppIcons.arrowBack),
            ),
            actions: [
              GestureDetector(
                onTap: () {
                  Get.back();
                },
                child: const Icon(AppIcons.notifications),
              ),
              const SizedBox(width: 10),
            ],
          ),
          //AppBar field end
          //main field of the screen start

          //main field of the screen end
        ],
      ),
    );
  }
}

class _AppBarTitleField extends StatefulWidget {
  @override
  State<_AppBarTitleField> createState() => _AppBarTitleFieldState();
}

class _AppBarTitleFieldState extends State<_AppBarTitleField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Get.toNamed(
              RouteHelper.initialRoute,
              preventDuplicates: true,
            );
          },
          child: const Icon(AppIcons.arrowBack),
        ),
        const SizedBox(width: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MiddleTextWidget(text: "Category Name"),
          ],
        ),
        const SizedBox(width: 5),
        const SizedBox(width: 5),
      ],
    );
  }
}
