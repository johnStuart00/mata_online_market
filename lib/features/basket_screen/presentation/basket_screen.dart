import 'package:flutter/material.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mata_online_market/core/widgets/icon_container_widget.dart';
import 'package:mata_online_market/core/widgets/mark_text_widget.dart';
import 'package:mata_online_market/core/widgets/middle_text_widget.dart';
import 'package:mata_online_market/core/widgets/small_text_widget.dart';

class BasketScreen extends StatelessWidget {
  final List<String> products;

  const BasketScreen({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: products.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'No products added to the basket.',
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
                  title: Text(AppLocalizations.of(context)!.sebedim),
                ),
                SliverPadding(
                  padding: const EdgeInsets.all(10.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Padding(
                          padding: AppSpacing.smallPadding,
                          child: _BasketContainerWidget(
                            imageUrl: 'assets/images/2.jpg',
                            productName: 'Product name',
                            productDescription: 'Product description',
                            productPrice: 10.0,
                            onDecreasePressed: () {},
                            onIncreasePressed: () {},
                            onLikePressed: () {},
                            productQuantity: index + 1,
                          ),
                        );
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

class _BasketContainerWidget extends StatelessWidget {
  final String imageUrl;
  final String productName;
  final String productDescription;
  final double productPrice;
  final int productQuantity;
  final VoidCallback onLikePressed;
  final VoidCallback onIncreasePressed;
  final VoidCallback onDecreasePressed;

  const _BasketContainerWidget({
    required this.imageUrl,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productQuantity,
    required this.onLikePressed,
    required this.onIncreasePressed,
    required this.onDecreasePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        borderRadius: AppSpacing.cardRadius,
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Theme.of(context).shadowColor.withOpacity(0.3),
            blurRadius: 5.0,
            spreadRadius: 0.01,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: AppSpacing.cardRadius,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(imageUrl),
                ),
              ),
            ),
          ),
          const SizedBox(width: 8.0),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MiddleTextWidget(text: productName),
                    GestureDetector(
                        onTap: () {},
                        child: const IconWidget(icon: AppIcons.unliked)),
                  ],
                ),
                MiddleTextWidget(text: productDescription),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MarkTextWidget(
                        text: '${productPrice.toStringAsFixed(2)} TMT'),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              onDecreasePressed();
                            },
                            child: const IconWidget(icon: AppIcons.remove)),
                        SmallTextWidget(
                          text: productQuantity.toString(),
                        ),
                        GestureDetector(
                            onTap: () {
                              onIncreasePressed();
                            },
                            child: const IconWidget(icon: AppIcons.add))
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
