import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/config/routes/route_helper.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mata_online_market/core/widgets/empty_page_widget.dart';
import 'package:mata_online_market/core/widgets/product_container_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';

class FavoritesScreen extends StatefulWidget {
  final List<String> products;

  const FavoritesScreen({super.key, required this.products});

  @override
  State<FavoritesScreen> createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  bool liked = false;

  void _updateLiked(bool newValue) {
    setState(() {
      liked = newValue;
    });
  }

  List<String> newProductImages = [
    'assets/images/new_product/1.jpg',
    'assets/images/new_product/2.jpg',
    'assets/images/new_product/3.jpg',
    'assets/images/new_product/4.jpg',
    'assets/images/new_product/5.jpg',
    'assets/images/new_product/6.jpg',
    'assets/images/new_product/7.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            floating: true,
            snap: true,
            centerTitle: true,
            automaticallyImplyLeading: false,
            title: MiddleTextWidget(
              text: AppLocalizations.of(context)!.halanlarym,
            ),
          ),
          widget.products.isEmpty
              //if products list empty
              ? const SliverFillRemaining(
                  hasScrollBody: false,
                  child: EmptyPageWidget(),
                )
              // if products list not empty
              : SliverPadding(
                  padding: const EdgeInsets.all(10.0),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
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
                            onTap: () {
                              Get.toNamed(RouteHelper.productViewScreen);
                            },
                            child: ProductContainerWidget(
                              discountProductImage: newProductImages[index],
                              onLiked: liked,
                              onLikedChanged: _updateLiked,
                            ),
                          ),
                        );
                      },
                      childCount: newProductImages.length,
                    ),
                  ),
                ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}
