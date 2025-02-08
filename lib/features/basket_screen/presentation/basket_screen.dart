import 'package:flutter/material.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/product_container_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BasketScreen extends StatelessWidget {
  final List<String> products;

  const BasketScreen({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products.isEmpty
          ? const CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Center(
                    child: Text('No products added to the basket.'),
                  ),
                )
              ],
            )
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  title: Text(AppLocalizations.of(context)!.sebedim),
                  floating: true,
                  snap: true,
                  centerTitle: true,
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(10.0),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 300.0,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return const Padding(
                          padding: AppSpacing.smallPadding,
                          child: ProductContainerWidget(),
                        );
                      },
                      childCount: products.length,
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
