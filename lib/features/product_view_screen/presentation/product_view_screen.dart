import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/config/routes/route_helper.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_dimension.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/product_container_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/big_text_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/old_mark_text_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mata_online_market/features/product_view_screen/widgets/product_image_carousel.dart';

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
        child: Stack(children: [
          CustomScrollView(slivers: [
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
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 300,
                child: ProductImageCarousel(),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            //image corousel end
            //product title start
            const SliverToBoxAdapter(
              child: BigTextWidget(text: 'Haryt ady'),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            const SliverToBoxAdapter(
              child: _MukdaryField(),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            const SliverToBoxAdapter(
              child: Row(
                children: <Widget>[
                  OldMarkTextWidget(text: 'Köne baha'),
                  SizedBox(width: 3),
                  MiddleTextWidget(text: 'Täze baha'),
                ],
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 10)),
            const SliverToBoxAdapter(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigTextWidget(text: 'Beýany'),
                  SizedBox(height: 5),
                  SizedBox(
                    height: 100.0,
                    child: MiddleTextWidget(
                      text: 'Beýan barada giňişleýin maglumat ',
                    ),
                  ),
                ],
              ),
            ),
            const SliverToBoxAdapter(
              child: BigTextWidget(text: 'Sizi gyzyklandyryp biler:'),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(10.0),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300.0,
                  mainAxisExtent: 245.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return Padding(
                      padding: AppSpacing.smallPadding,
                      child: GestureDetector(
                          onTap: () {}, child: const ProductContainerWidget()),
                    );
                  },
                  childCount: 5,
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 100)),
            //product title end
            //main field of the screen end
          ]),
          Positioned(
              bottom: 10.0,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: AppDimensions.screenWidth(context),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Theme.of(context)
                          .bottomNavigationBarTheme
                          .backgroundColor,
                      borderRadius: AppSpacing.cardRadius,
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Theme.of(context).shadowColor.withOpacity(0.3),
                          blurRadius: 5.0,
                          spreadRadius: 0.01,
                          offset: const Offset(0, 2),
                        ),
                      ]),
                  child: const MiddleTextWidget(text: 'Sebede goşmak'),
                ),
              ))
        ]),
      ),
    );
  }
}

class _MukdaryField extends StatelessWidget {
  const _MukdaryField();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const MiddleTextWidget(text: 'Mukdary'),
        Container(
          height: 30,
          width: 100,
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: Colors.grey.withOpacity(0.5),
            borderRadius: AppSpacing.cardRadius,
          ),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MiddleTextWidget(text: '-'),
              SizedBox(width: 3),
              MiddleTextWidget(text: '0.5'),
              SizedBox(width: 3),
              MiddleTextWidget(text: '+'),
            ],
          ),
        )
      ],
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
