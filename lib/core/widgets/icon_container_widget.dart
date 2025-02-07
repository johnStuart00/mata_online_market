import 'package:flutter/material.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';

class IconWidget extends StatelessWidget {
  final IconData icon;
  const IconWidget({
    super.key,
    required this.icon,
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
              // ignore: deprecated_member_use
              ?.withOpacity(0.7),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
          boxShadow: [
            BoxShadow(
              // ignore: deprecated_member_use
              color: Theme.of(context).shadowColor.withOpacity(0.1),
              blurRadius: 3.0,
              spreadRadius: 0.5,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 18,
        ), //AppIcons.unliked
      ),
    );
  }
}
