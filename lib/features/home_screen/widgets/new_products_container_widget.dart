import 'package:flutter/material.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/icon_container_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';

class NewProductsWidget extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String newProductImage;
  final bool onliked;
  final Function(bool) onLikedChanged;
  const NewProductsWidget({
    super.key,
    required this.newProductImage,
    required this.onliked,
    required this.onLikedChanged,
  });

  @override
  State<NewProductsWidget> createState() => _NewProductsWidgetState();
}

class _NewProductsWidgetState extends State<NewProductsWidget> {
  late bool isLiked;

  @override
  void initState() {
    super.initState();
    isLiked = widget.onliked;
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
      height: 190,
      width: 320,
      decoration: BoxDecoration(
        color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        borderRadius: AppSpacing.cardRadius,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 190,
              decoration: BoxDecoration(
                borderRadius: AppSpacing.cardRadius,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    widget.newProductImage,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _toggleLike();
                      },
                      child: isLiked
                          ? const IconWidget(icon: AppIcons.liked)
                          : const IconWidget(icon: AppIcons.unliked),
                    ),
                  ],
                ),
                const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MiddleTextWidget(
                      text: 'Product Name',
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    MiddleTextWidget(
                      text: 'Product Description',
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    MiddleTextWidget(
                      text: 'Product Price',
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
