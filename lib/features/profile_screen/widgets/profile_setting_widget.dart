import 'package:flutter/material.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';

class ProfileSettingWidget extends StatelessWidget {
  final IconData icon;
  final String text;
  final Widget value;
  final VoidCallback? onTap;

  const ProfileSettingWidget({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        padding: AppSpacing.smallPadding,
        decoration: BoxDecoration(
          color: Theme.of(context)
              .bottomNavigationBarTheme
              .backgroundColor
              // ignore: deprecated_member_use
              ?.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).iconTheme.color!,
            width: 1.0,
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
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 5),
            MiddleTextWidget(text: text),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  value,
                ],
              ),
            ),
            const SizedBox(width: 5),
          ],
        ),
      ),
    );
  }
}
