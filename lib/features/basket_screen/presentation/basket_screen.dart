import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/config/routes/route_helper.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mata_online_market/core/widgets/empty_page_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';
import 'package:mata_online_market/features/basket_screen/widgets/basket_container_widget.dart';

class BasketScreen extends StatefulWidget {
  final List<String> products;

  const BasketScreen({super.key, required this.products});

  @override
  State<BasketScreen> createState() => _BasketScreenState();
}

class _BasketScreenState extends State<BasketScreen> {
  double productQuantity = 0.5;
  bool liked = false;

  void _updateMukdary(double newValue) {
    setState(() {
      productQuantity = newValue;
    });
  }

  void _updateLiked(bool newValue) {
    setState(() {
      liked = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                floating: true,
                snap: true,
                centerTitle: true,
                automaticallyImplyLeading: false,
                title: MiddleTextWidget(
                    text: AppLocalizations.of(context)!.sebedim),
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
                      sliver: SliverList(
                        delegate: SliverChildBuilderDelegate(
                          (context, index) {
                            return Padding(
                              padding: AppSpacing.smallPadding,
                              child: GestureDetector(
                                onTap: () {
                                  Get.toNamed(RouteHelper.productViewScreen);
                                },
                                child: BasketContainerWidget(
                                  imageUrl: 'assets/images/2.jpg',
                                  productName: 'Product name',
                                  productDescription: 'Product description',
                                  productPrice: 10.0,
                                  productQuantity: productQuantity,
                                  onLiked: liked,
                                  onLikedChanged: _updateLiked,
                                  onQuantityChanged: _updateMukdary,
                                ),
                              ),
                            );
                          },
                          childCount: widget.products.length,
                        ),
                      ),
                    ),
              const SliverToBoxAdapter(child: SizedBox(height: 160)),
            ],
          ),
          // order button start
          Positioned(
            bottom: 115,
            right: 20,
            child: Container(
              height: 50,
              width: 150,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: AppSpacing.cardRadius,
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Theme.of(context)
                          .shadowColor
                          // ignore: deprecated_member_use
                          .withOpacity(0.3),
                      blurRadius: 5.0,
                      spreadRadius: 0.01,
                      offset: const Offset(0, 2),
                    ),
                  ]),
              child: MiddleTextWidget(
                  text: AppLocalizations.of(context)!.sargytEtmek),
            ),
            //order button end
          )
        ],
      ),
    );
  }
}
