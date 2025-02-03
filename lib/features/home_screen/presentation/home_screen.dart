import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/banner_widget.dart';
import 'package:mata_online_market/core/widgets/circle_container_widget.dart';
import 'package:mata_online_market/core/widgets/mark_text_widget.dart';
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
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //AppBar field start
          const SliverAppBar(
            pinned: true,
            expandedHeight: 30,
            flexibleSpace: FlexibleSpaceBar(
              title: _AppBarField(),
            ),
          ),
          //AppBar field end
          //Search field start
          const SliverToBoxAdapter(
            child: _SearchField(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          //Search field end
          //Category field start
          const SliverToBoxAdapter(
            child: _CategoryField(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          //Category field end
          //Banner field start
          const SliverToBoxAdapter(
            child: _BannerField(),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          //Banner field end
          //Aksiya field start
          SliverToBoxAdapter(
            child: SizedBox(
              height: 400,
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                      color: Colors.amber[300],
                      borderRadius: const BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                  Padding(
                    padding: AppSpacing.cardPadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SmallTextWidget(
                            text: AppLocalizations.of(context)!
                                .ahliKategoriyalar),
                        GestureDetector(
                            onTap: () {},
                            child: MarkTextWidget(
                                text: AppLocalizations.of(context)!.hemmesi)),
                      ],
                    ),
                  ),
                  Positioned(
                    top: 35.0,
                    left: 20.0,
                    child: Container(
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
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
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
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('-2000 TMT'),
                                      Text('Icon'),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [Text('basget')],
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Expanded(
                            flex: 1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                MiddleTextWidget(text: "Product name"),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    MiddleTextWidget(text: "Old price"),
                                    MiddleTextWidget(text: 'New price')
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          //Aksiya field end
        ],
      ),
    );
  }
}

class _BannerField extends StatelessWidget {
  const _BannerField();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          Padding(
            padding: AppSpacing.widgetHorizontalPadding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SmallTextWidget(text: AppLocalizations.of(context)!.banner),
              ],
            ),
          ),
          const SizedBox(height: 5),
          const BannerWidget()
        ],
      ),
    );
  }
}

class _CategoryField extends StatelessWidget {
  const _CategoryField();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: AppSpacing.widgetHorizontalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              SmallTextWidget(
                  text: AppLocalizations.of(context)!.ahliKategoriyalar),
              GestureDetector(
                  onTap: () {},
                  child: MarkTextWidget(
                      text: AppLocalizations.of(context)!.hemmesi)),
            ],
          ),
        ),
        const SizedBox(height: 5),
        Padding(
          padding: AppSpacing.widgetOnlyLeftPadding,
          child: SizedBox(
            height: 90,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              itemBuilder: (context, index) {
                return CircleContainerWidget(
                  imageUrl:
                      "https://play-lh.googleusercontent.com/bttPbG01UOVce0e_dSzULi-UoT3jNADmKtKKQnKk7zIoJufnqXkwDzOyfppm3kZUTw=w240-h480-rw",
                  categoryName: "Category $index",
                );
              },
            ),
          ),
        ),
      ],
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
