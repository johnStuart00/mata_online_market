import 'package:flutter/material.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/icon_container_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/old_mark_text_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/small_text_widget.dart';

class ProductContainerWidget extends StatefulWidget {
  final String discountProductImage;
  final bool onLiked;
  final Function(bool) onLikedChanged;
  const ProductContainerWidget({
    super.key,
    required this.discountProductImage,
    required this.onLiked,
    required this.onLikedChanged,
  });

  @override
  State<ProductContainerWidget> createState() => _ProductContainerWidgetState();
}

class _ProductContainerWidgetState extends State<ProductContainerWidget> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.onLiked;
  }

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
      widget.onLikedChanged(isLiked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 235,
      width: 165,
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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: AppSpacing.cardRadius,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(widget.discountProductImage),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _DiscountWidget(),
                      GestureDetector(
                        onTap: () {
                          _toggleLike();
                          widget.onLikedChanged(isLiked);
                        },
                        child: isLiked
                            ? const IconWidget(icon: AppIcons.liked)
                            : const IconWidget(icon: AppIcons.unliked),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 5),
                MiddleTextWidget(text: "Product name"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    OldMarkTextWidget(text: "Old price"),
                    SizedBox(width: 5),
                    MiddleTextWidget(text: 'New price')
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class _DiscountWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.smallPadding,
      child: Container(
        padding: AppSpacing.smallPadding,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: const SmallTextWidget(text: '-2000 TMT'),
      ),
    );
  }
}
