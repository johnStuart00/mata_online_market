import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/config/routes/route_helper.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mata_online_market/core/widgets/empty_page_widget.dart';
import 'package:mata_online_market/core/widgets/product_container_widget.dart';

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
            title: Text(AppLocalizations.of(context)!.halanlarym),
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
                              onLiked: liked,
                              onLikedChanged: _updateLiked,
                            ),
                          ),
                        );
                      },
                      childCount: widget.products.length,
                    ),
                  ),
                ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}
