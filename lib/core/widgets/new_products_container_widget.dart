import 'package:flutter/material.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/icon_container_widget.dart';
import 'package:mata_online_market/core/widgets/middle_text_widget.dart';

class NewProductsWidget extends StatelessWidget {
  const NewProductsWidget({
    super.key,
  });

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
              decoration: const BoxDecoration(
                borderRadius: AppSpacing.cardRadius,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://play-lh.googleusercontent.com/bttPbG01UOVce0e_dSzULi-UoT3jNADmKtKKQnKk7zIoJufnqXkwDzOyfppm3kZUTw=w240-h480-rw'),
                ),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  IconWidget(
                    icon: AppIcons.unbasket,
                  ),
                ],
              ),
            ),
          ),
          const Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconWidget(
                      icon: AppIcons.unliked,
                    ),
                  ],
                ),
                Column(
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
