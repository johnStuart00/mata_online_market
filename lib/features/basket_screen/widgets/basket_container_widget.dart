import 'package:flutter/material.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/icon_container_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/mark_text_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';

class BasketContainerWidget extends StatefulWidget {
  final String imageUrl;
  final String productName;
  final String productDescription;
  final double productPrice;
  final double productQuantity;
  final VoidCallback onLikePressed;
  final Function(double) onQuantityChanged;

  const BasketContainerWidget({
    super.key,
    required this.imageUrl,
    required this.productName,
    required this.productDescription,
    required this.productPrice,
    required this.productQuantity,
    required this.onQuantityChanged,
    required this.onLikePressed,
  });

  @override
  State<BasketContainerWidget> createState() => _BasketContainerWidgetState();
}

class _BasketContainerWidgetState extends State<BasketContainerWidget> {
  late double productQuantity;

  @override
  void initState() {
    super.initState();
    productQuantity = widget.productQuantity;
  }

  void _onIncreasePressed() {
    setState(() {
      productQuantity += 0.5;
      widget.onQuantityChanged(productQuantity);
    });
  }

  void _onDecreasePressed() {
    setState(() {
      if (productQuantity > 0) productQuantity -= 0.5;
      widget.onQuantityChanged(productQuantity);
    });
  }

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
                  image: AssetImage(widget.imageUrl),
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
                    MiddleTextWidget(text: widget.productName),
                    GestureDetector(
                        onTap: () {},
                        child: const IconWidget(icon: AppIcons.unliked)),
                  ],
                ),
                MiddleTextWidget(text: widget.productDescription),
                const SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    MarkTextWidget(
                        text: '${widget.productPrice.toStringAsFixed(2)} TMT'),
                    Row(
                      children: [
                        GestureDetector(
                            onTap: () {
                              _onDecreasePressed();
                            },
                            child: const IconWidget(icon: AppIcons.remove)),
                        SizedBox(
                          width: 30,
                          child: Center(
                            child: MiddleTextWidget(
                              text: '$productQuantity',
                            ),
                          ),
                        ),
                        GestureDetector(
                            onTap: () {
                              _onIncreasePressed();
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
