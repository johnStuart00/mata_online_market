import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/text_widgets/mark_text_widget.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';

class LocationContainerWidget extends StatefulWidget {
  const LocationContainerWidget({super.key});

  @override
  State<LocationContainerWidget> createState() =>
      _LocationContainerWidgetState();
}

class _LocationContainerWidgetState extends State<LocationContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: const MiddleTextWidget(
          text: 'Dükanlar',
        ),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(AppIcons.arrowBack),
        ),
      ),
      body: Padding(
        padding: AppSpacing.smallPadding,
        child: Container(
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
                  decoration: const BoxDecoration(
                    borderRadius: AppSpacing.cardRadius,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage(''),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
              const Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MiddleTextWidget(text: 'Shop name'),
                      ],
                    ),
                    MiddleTextWidget(text: 'shop location'),
                    SizedBox(height: 8.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        MarkTextWidget(
                          text: 'phone number',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
