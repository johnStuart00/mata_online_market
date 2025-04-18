import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/config/routes/route_helper.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/features/home_screen/widgets/banner_widget.dart';
import 'package:mata_online_market/features/home_screen/widgets/circle_container_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/mark_text_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';
import 'package:mata_online_market/features/home_screen/widgets/new_products_container_widget.dart';
import 'package:mata_online_market/core/widgets/product_container_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/small_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const String backDiscountImagePath = "assets/images/back_discount.png";
  static const String backNewProductImagePath =
      "assets/images/back_new_products.png";

  bool productliked = false;
  bool newProductliked = false;

  void _updateProductLiked(bool newValue) {
    setState(() {
      productliked = newValue;
    });
  }

  void _updateNewProductLiked(bool newValue) {
    setState(() {
      newProductliked = newValue;
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
          //AppBar field start
          const SliverAppBar(
            pinned: true,
            expandedHeight: 30,
            automaticallyImplyLeading: false,
            flexibleSpace: FlexibleSpaceBar(
              title: _AppBarField(),
            ),
          ),
          //AppBar field end
          //Search field start
          const SliverToBoxAdapter(
            child: _SearchField(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          //Search field end
          //Category field start
          SliverToBoxAdapter(
            child: _CategoryField(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          //Category field end
          //Banner field start
          const SliverToBoxAdapter(
            child: _BannerField(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          //Banner field end
          //Aksiya field start
          SliverToBoxAdapter(
            child: SizedBox(
              height: 290,
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(backDiscountImagePath),
                      ),
                    ),
                  ),
                  Padding(
                    padding: AppSpacing.cardPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SmallTextWidget(
                            text: AppLocalizations.of(context)!
                                .aksiyadakyHarytlar),
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.categoryViewScreen);
                            },
                            child: MarkTextWidget(
                                text: AppLocalizations.of(context)!.hemmesi)),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 35.0,
                    left: 0.0,
                    right: 0.0,
                    child: SizedBox(
                      height: 250,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: newProductImages.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: AppSpacing.smallPadding,
                            child: GestureDetector(
                              onTap: () {
                                Get.toNamed(RouteHelper.productViewScreen);
                              },
                              child: ProductContainerWidget(
                                discountProductImage: newProductImages[index],
                                onLiked: productliked,
                                onLikedChanged: _updateProductLiked,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          //Aksiya field end
          //New products field start
          SliverToBoxAdapter(
            child: Container(
              height: 240,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(backNewProductImagePath),
                ),
              ),
              child: Column(
                children: [
                  Padding(
                    padding: AppSpacing.cardPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SmallTextWidget(
                            text: AppLocalizations.of(context)!
                                .tazeGelenHarytlar),
                        GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.categoryViewScreen);
                            },
                            child: MarkTextWidget(
                                text: AppLocalizations.of(context)!.hemmesi)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: newProductImages.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: AppSpacing.smallPadding,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(RouteHelper.productViewScreen);
                            },
                            child: NewProductsWidget(
                              newProductImage: newProductImages[index],
                              onliked: newProductliked,
                              onLikedChanged: _updateNewProductLiked,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          //New products field end
          //All product field start
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverToBoxAdapter(
            child: Padding(
              padding: AppSpacing.widgetHorizontalPadding,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.categoryViewScreen);
                    },
                    child: MiddleTextWidget(
                      text: AppLocalizations.of(context)!.hemmesi,
                    ),
                  ),
                  Container(
                    padding: AppSpacing.smallPadding,
                    decoration: BoxDecoration(
                      color: Theme.of(context)
                          .bottomNavigationBarTheme
                          .backgroundColor
                          // ignore: deprecated_member_use
                          ?.withOpacity(0.7),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                      border: Border.all(
                        color: Theme.of(context).iconTheme.color!,
                        width: 1.0,
                      ),
                      boxShadow: [
                        BoxShadow(
                          // ignore: deprecated_member_use
                          color: Theme.of(context).shadowColor.withOpacity(0.1),
                          blurRadius: 3.0,
                          spreadRadius: 0.5,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: GestureDetector(
                      onTapDown: (TapDownDetails details) {
                        final RenderBox overlay = Overlay.of(context)
                            .context
                            .findRenderObject() as RenderBox;

                        showMenu(
                          context: context,
                          position: RelativeRect.fromRect(
                            details.globalPosition &
                                const Size(40, 40), // Position of tap
                            Offset.zero & overlay.size, // Screen size
                          ),
                          items: [
                            const PopupMenuItem(
                              value: 'Ahlisi',
                              child: Text('Ahlisi'),
                            ),
                          ],
                        ).then((value) {
                          if (value != null) {
                            // ignore: avoid_print
                            print('Selected: $value');
                          }
                        });
                      },
                      child: const Icon(
                        AppIcons.sort,
                        size: 18,
                      ),
                    ), //AppIcons.unliked
                  ),
                ],
              ),
            ),
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
                      onTap: () {
                        Get.toNamed(RouteHelper.productViewScreen);
                      },
                      child: ProductContainerWidget(
                        discountProductImage: newProductImages[index],
                        onLiked: productliked,
                        onLikedChanged: _updateProductLiked,
                      ),
                    ),
                  );
                },
                childCount: newProductImages.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
          //All product field end
        ],
      ),
    );
  }
}

class _BannerField extends StatelessWidget {
  const _BannerField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240,
      child: Column(
        children: [
          Padding(
            padding: AppSpacing.widgetHorizontalPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SmallTextWidget(text: AppLocalizations.of(context)!.banner),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const BannerWidget()
        ],
      ),
    );
  }
}

// ignore: must_be_immutable
class _CategoryField extends StatelessWidget {
  List<String> categoryName = [
    'Ýeňil matalar',
    'Gyş matalar',
    'Jalbar mata',
    'Gyz mata',
    'Erkek mata',
  ];

  List<String> categoryPhotos = [
    'assets/images/category_images/1.jpg',
    'assets/images/category_images/2.jpg',
    'assets/images/category_images/3.jpg',
    'assets/images/category_images/4.jpg',
    'assets/images/category_images/5.jpg',
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppSpacing.widgetHorizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SmallTextWidget(
                  text: AppLocalizations.of(context)!.ahliKategoriyalar),
              GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.categoryViewScreen);
                  },
                  child: MarkTextWidget(
                      text: AppLocalizations.of(context)!.hemmesi)),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: AppSpacing.widgetOnlyLeftPadding,
          child: SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryName.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Get.toNamed(RouteHelper.categoryViewScreen);
                  },
                  child: CircleContainerWidget(
                    imageUrl: categoryPhotos[index],
                    categoryName: categoryName[index],
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _AppBarField extends StatelessWidget {
  const _AppBarField();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: AppSpacing.widgetHorizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MiddleTextWidget(text: "The logo"),
            ],
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(AppIcons.notifications),
            ],
          )),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.widgetHorizontalPadding,
      child: GestureDetector(
          onTap: () {
            Get.toNamed(RouteHelper.searchScreen);
          },
          child: Container(
            padding: AppSpacing.cardPadding,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                  size: 20.0,
                ),
                const SizedBox(width: 10),
                SmallTextWidget(
                    text: AppLocalizations.of(context)!.harytlaryGozlan),
              ],
            ),
          )),
    );
  }
}
