import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/text_widgets/middle_text_widget.dart';
import 'package:mata_online_market/features/profile_screen/widgets/location_widget.dart';
import 'package:mata_online_market/features/profile_screen/widgets/profile_setting_widget.dart';
import 'package:mata_online_market/features/profile_screen/widgets/theme_switcher.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool isUserLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> profileSettings = [
      {
        'icon': AppIcons.darkMode,
        'text': AppLocalizations.of(context)!.garankyTema,
        'value': const ThemeModeSwitcher(),
      },
      {
        'icon': AppIcons.user,
        'text': AppLocalizations.of(context)!.prifile,
        'value': const SizedBox(),
        'ontap': () {
          if (isUserLoggedIn) {
            Get.dialog(
              const AlertDialog(
                title: Text("loggedin"),
              ),
            );
          } else {
            Get.defaultDialog(
              title: 'Bagyşlaň',
              content: const MiddleTextWidget(
                  text: 'Bu sahypa geçmek üçin siz agza bolmaly'),
              textConfirm: 'Bolýa',
              onConfirm: () {
                Get.back();
              },
            );
          }
        },
      },
      {
        'icon': AppIcons.location,
        'text': AppLocalizations.of(context)!.salgy,
        'value': const SizedBox(),
        'ontap': () {
          Get.to(() => const LocationContainerWidget());
        },
      },
      {
        'icon': AppIcons.keepInChat,
        'text': AppLocalizations.of(context)!.habarnama,
        'value': const SizedBox(),
      },
      {
        'icon': AppIcons.language,
        'text': AppLocalizations.of(context)!.dil,
        'value': const SizedBox(),
      },
      {
        'icon': AppIcons.helpAndSupport,
        'text': AppLocalizations.of(context)!.komekWeGoldaw,
        'value': const SizedBox(),
      },
      {
        'icon': AppIcons.securityPrivacy,
        'text': AppLocalizations.of(context)!.gizlinlikSyyasaty,
        'value': const SizedBox(),
      },
      {
        'icon': AppIcons.conditions,
        'text': AppLocalizations.of(context)!.sertler,
        'value': const SizedBox(),
      },
      {
        'icon': AppIcons.aboutUs,
        'text': AppLocalizations.of(context)!.bizBarada,
        'value': const SizedBox(),
      },
      {
        'icon': AppIcons.version,
        'text': AppLocalizations.of(context)!.wersiyasy,
        'value': const MiddleTextWidget(text: '1.0'),
      },
      {
        'icon': AppIcons.singIn,
        'text': AppLocalizations.of(context)!.hasabaGir,
        'value': const SizedBox(),
      },
    ];
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //AppBar field start
          const SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            expandedHeight: 220,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: _AppBarField(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          //AppBar field end
          //Profile settings field start
          SliverToBoxAdapter(
            child: Padding(
              padding: AppSpacing.cardPadding,
              child: ListView.builder(
                shrinkWrap:
                    true, // Important for using inside SliverToBoxAdapter
                physics:
                    const NeverScrollableScrollPhysics(), // Prevents conflict with CustomScrollView
                itemCount: profileSettings.length,
                itemBuilder: (context, index) {
                  final item = profileSettings[index];
                  return ProfileSettingWidget(
                    icon: item['icon'],
                    text: item['text'],
                    value: item['value'],
                    onTap: item['ontap'],
                  );
                },
              ),
            ),
          ),
          //Profile settings field end
          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}

class _AppBarField extends StatelessWidget {
  const _AppBarField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: AppSpacing.cardPadding,
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: AppSpacing.cardRadius,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 100.0,
              height: 100.0,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      'https://play-lh.googleusercontent.com/bttPbG01UOVce0e_dSzULi-UoT3jNADmKtKKQnKk7zIoJufnqXkwDzOyfppm3kZUTw=w240-h480-rw'),
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            const MiddleTextWidget(text: 'Myhman')
          ],
        ),
      ),
    );
  }
}
