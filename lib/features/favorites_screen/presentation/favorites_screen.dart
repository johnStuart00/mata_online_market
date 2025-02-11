import 'package:flutter/material.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mata_online_market/core/widgets/product_container_widget.dart';

class FavoritesScreen extends StatelessWidget {
  final List<String> products;

  const FavoritesScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No favorites added.',
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  floating: true,
                  snap: true,
                  centerTitle: true,
                  automaticallyImplyLeading: false,
                  title: Text(AppLocalizations.of(context)!.halanlarym),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(10.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return const Padding(
                            padding: AppSpacing.smallPadding,
                            child: ProductContainerWidget());
                      },
                      childCount: products.length,
                    ),
                  ),
                )
              ],
            ),
    );
  }
}
