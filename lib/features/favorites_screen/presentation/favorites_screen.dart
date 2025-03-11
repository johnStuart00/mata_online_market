import 'package:flutter/material.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mata_online_market/core/widgets/empty_page_widget.dart';
import 'package:mata_online_market/core/widgets/product_container_widget.dart';

class FavoritesScreen extends StatelessWidget {
  final List<String> products;

  const FavoritesScreen({super.key, required this.products});

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
          products.isEmpty
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
                        return const Padding(
                            padding: AppSpacing.smallPadding,
                            child: ProductContainerWidget());
                      },
                      childCount: products.length,
                    ),
                  ),
                ),
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}
