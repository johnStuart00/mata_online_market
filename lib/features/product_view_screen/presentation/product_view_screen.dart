import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/config/routes/route_helper.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_dimension.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/product_container_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/big_text_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/mark_text_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/old_mark_text_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mata_online_market/features/product_view_screen/widgets/amount_field.dart';
import 'package:mata_online_market/features/product_view_screen/widgets/product_image_carousel.dart';

class ProductViewScreen extends StatefulWidget {
  const ProductViewScreen({super.key});

  @override
  State<ProductViewScreen> createState() => _ProductViewScreenState();
}

class _ProductViewScreenState extends State<ProductViewScreen> {
  int basketProductCount = 0;
  bool checkInsideBusket = false;
  void _basketProductAdd() {
    setState(() {
      if (checkInsideBusket) {
        basketProductCount--;
      } else {
        basketProductCount++;
      }

      checkInsideBusket = !checkInsideBusket;
    });
  }

  bool isLiked = false;

  double mataMukdaryValue = 0.5;

  bool liked = false;

  void _updateLiked(bool newValue) {
    setState(() {
      liked = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
          SizedBox(
            width: 30,
            child: Stack(children: [
              const Icon(AppIcons.basket),
              Positioned(
                top: 0,
                right: 0,
                child: Container(
                  width: 15,
                  height: 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: Theme.of(context)
                        .bottomNavigationBarTheme
                        .backgroundColor,
                    borderRadius: AppSpacing.cardRadius,
                  ),
                  child: MarkTextWidget(text: '$basketProductCount'),
                ),
              )
            ]),
          ),
          const SizedBox(width: 10),
        ],
      ),
      body: Padding(
        padding: AppSpacing.smallPadding,
        child: Stack(children: [
          CustomScrollView(
            slivers: [
              //main field of the screen start
              //image corousel start
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 300,
                  child: ProductImageCarousel(
                    liked: isLiked,
                  ),
                ),
              ),
              //image corousel end
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              //product title start
              SliverToBoxAdapter(
                child:
                    BigTextWidget(text: AppLocalizations.of(context)!.harytAdy),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              const SliverToBoxAdapter(
                child: AmountField(),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              //new price and old price start
              const SliverToBoxAdapter(
                child: Row(
                  children: <Widget>[
                    OldMarkTextWidget(text: 'Köne baha'),
                    SizedBox(width: 3),
                    MiddleTextWidget(text: 'Täze baha'),
                  ],
                ),
              ),
              //new price and old price end
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              //product description start
              SliverToBoxAdapter(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigTextWidget(text: AppLocalizations.of(context)!.beyany),
                    const SizedBox(height: 5),
                    const SizedBox(
                      height: 100.0,
                      child: MiddleTextWidget(
                        text: 'Beýan barada giňişleýin maglumat ',
                      ),
                    ),
                  ],
                ),
              ),
              //product description end
              const SliverToBoxAdapter(child: SizedBox(height: 10)),
              //interest products start
              SliverToBoxAdapter(
                child: BigTextWidget(
                    text: AppLocalizations.of(context)!.siziGyzyklandyrypBiler),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(0.0),
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
                            Get.toNamed(
                              RouteHelper.productViewScreen,
                            );
                          },
                          child: ProductContainerWidget(
                            onLiked: liked,
                            onLikedChanged: _updateLiked,
                          ),
                        ),
                      );
                    },
                    childCount: 5,
                  ),
                ),
              ),
              //interest products end
              const SliverToBoxAdapter(child: SizedBox(height: 100)),
              //main field of the screen end
            ],
          ),
          //add to basket button start
          Positioned(
            bottom: 10.0,
            left: 0,
            right: 0,
            child: GestureDetector(
              onTap: () {
                _basketProductAdd();
              },
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
                child: MiddleTextWidget(
                    text: AppLocalizations.of(context)!.sebedeGosmak),
              ),
            ),
            //add to basket button end
          )
        ]),
      ),
    );
  }
}
