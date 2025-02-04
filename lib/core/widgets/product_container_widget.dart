import 'package:flutter/material.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/line_through_text_widget.dart';
import 'package:mata_online_market/core/widgets/middle_text_widget.dart';
import 'package:mata_online_market/core/widgets/small_text_widget.dart';

class ProductContainerWidget extends StatelessWidget {
  const ProductContainerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 255,
      width: 160,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://play-lh.googleusercontent.com/bttPbG01UOVce0e_dSzULi-UoT3jNADmKtKKQnKk7zIoJufnqXkwDzOyfppm3kZUTw=w240-h480-rw'),
                ),
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _DiscountWidget(),
                      _IconWidget(),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('basget'),
                    ],
                  )
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
                    LineThroughTextWidget(text: "Old price"),
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

class _IconWidget extends StatelessWidget {
  const _IconWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.smallPadding,
      child: Container(
        padding: AppSpacing.smallPadding,
        decoration: BoxDecoration(
          color: Theme.of(context)
              .bottomNavigationBarTheme
              .backgroundColor
              ?.withOpacity(0.7),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: const Icon(
          AppIcons.liked,
          size: 18,
        ), //AppIcons.unliked
      ),
    );
  }
}

class _DiscountWidget extends StatelessWidget {
  const _DiscountWidget({
    super.key,
  });

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
