import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/config/routes/route_helper.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_dimension.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/icon_container_widget.dart';
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
      body: Padding(
        padding: AppSpacing.smallPadding,
        child: CustomScrollView(
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
                  child: const Icon(AppIcons.basket),
                ),
                const SizedBox(width: 10),
              ],
            ),
            //AppBar field end
            //main field of the screen start
            //image corousel start
            SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: ImageCarouselScreen(),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            //image corousel end
            //product title start
            const SliverToBoxAdapter(
              child: MiddleTextWidget(text: 'Haryt ady'),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            SliverToBoxAdapter(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const MiddleTextWidget(text: 'Mukdary'),
                  Container(
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.5),
                      borderRadius: AppSpacing.cardRadius,
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MiddleTextWidget(text: '-'),
                        SizedBox(width: 3),
                        MiddleTextWidget(text: '1'),
                        SizedBox(width: 3),
                        MiddleTextWidget(text: '+'),
                      ],
                    ),
                  )
                ],
              ),
            )

            //product title end
            //main field of the screen end
          ],
        ),
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

class ImageCarouselScreen extends StatefulWidget {
  @override
  State<ImageCarouselScreen> createState() => _ImageCarouselScreenState();
}

class _ImageCarouselScreenState extends State<ImageCarouselScreen> {
  final List<String> imageUrls = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: imageUrls.map((url) {
                return ClipRRect(
                  borderRadius: AppSpacing.cardRadius,
                  child: Image.network(
                    url,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                );
              }).toList(),
            ),
            Positioned(
              bottom: 15.0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageUrls.asMap().entries.map((entry) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Theme.of(context).textTheme.bodyLarge!.color!
                          // ignore: deprecated_member_use
                          : Colors.grey.withOpacity(0.5),
                    ),
                  );
                }).toList(),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: AppDimensions.screenWidth(context) * 0.15,
              child: const IconWidget(icon: AppIcons.unliked),
            ),
          ],
        ),
      ),
    );
  }
}
