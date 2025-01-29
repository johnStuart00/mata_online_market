import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/middle_text_widget.dart';
import 'package:mata_online_market/core/widgets/small_text_widget.dart';
import 'package:mata_online_market/features/search_screen/presentation/search_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 30,
            flexibleSpace: FlexibleSpaceBar(
              title: _AppBarField(),
            ),
          ),
          SliverToBoxAdapter(
            child: _SearchField(),
          ),
        ],
      ),
    );
  }
}

class _AppBarField extends StatelessWidget {
  const _AppBarField();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: AppSpacing.widgetHorizontalPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              MiddleTextWidget(text: "The logo"),
            ],
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Icon(AppIcons.notifications),
            ],
          )),
        ],
      ),
    );
  }
}

class _SearchField extends StatelessWidget {
  const _SearchField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppSpacing.widgetHorizontalPadding,
      child: GestureDetector(
          onTap: () {
            Get.to(() => const SearchScreen());
          },
          child: Container(
            padding: AppSpacing.cardPadding,
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.search,
                  color: Theme.of(context).iconTheme.color,
                  size: 20.0,
                ),
                const SizedBox(width: 10),
                SmallTextWidget(
                    text: AppLocalizations.of(context)!.harytlaryGozlan),
              ],
            ),
          )),
    );
  }
}
