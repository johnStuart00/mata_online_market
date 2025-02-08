import 'package:flutter/material.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BasketScreen extends StatelessWidget {
  final List<String> products;

  const BasketScreen({super.key, required this.products});

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
                        return Padding(
                          padding: AppSpacing.smallPadding,
                          child: _BasketContainerWidget(
                            imageUrl: 'assets/images/2.jpg',
                            productName: products[index],
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
                ),
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
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        children: [
          Image.network(
            imageUrl,
            width: 80,
            height: 80,
            fit: BoxFit.cover,
          ),
          const SizedBox(width: 8.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      productName,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.favorite_border),
                      onPressed: onLikePressed,
                    ),
                  ],
                ),
                Text(
                  productDescription,
                  style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '\$${productPrice.toStringAsFixed(2)}',
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.remove),
                          onPressed: onDecreasePressed,
                        ),
                        Text(
                          productQuantity.toString(),
                          style: const TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                        IconButton(
                          icon: const Icon(Icons.add),
                          onPressed: onIncreasePressed,
                        ),
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
