import 'package:flutter/material.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/middle_text_widget.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final List<Map<String, dynamic>> profileSettings = [
    {
      'icon': AppIcons.darkMode,
      'text': 'Garaňky tema',
      'value': '',
    },
    {
      'icon': AppIcons.bag,
      'text': 'Sargytlarym',
      'value': '',
    },
    {
      'icon': AppIcons.user,
      'text': 'Profile',
      'value': '',
    },
    {
      'icon': AppIcons.location,
      'text': 'Salgy',
      'value': '',
    },
    {
      'icon': AppIcons.keepInChat,
      'text': 'Habarnama',
      'value': '',
    },
    {
      'icon': AppIcons.language,
      'text': 'Dil',
      'value': '',
    },
    {
      'icon': AppIcons.helpAndSupport,
      'text': 'Kömek we goldaw',
      'value': '',
    },
    {
      'icon': AppIcons.securityPrivacy,
      'text': 'Gizlinlik syýasaty',
      'value': '',
    },
    {
      'icon': AppIcons.conditions,
      'text': 'Şertler',
      'value': '',
    },
    {
      'icon': AppIcons.aboutUs,
      'text': 'Biz barada',
      'value': '',
    },
    {
      'icon': AppIcons.version,
      'text': 'Wersiýasy',
      'value': '1.0',
    },
    {
      'icon': AppIcons.singIn,
      'text': 'Hasaba gir',
      'value': '',
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                  return ProfileSettingItem(
                    icon: item['icon'],
                    text: item['text'],
                    value: item['value'],
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

class ProfileSettingItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final String value;

  const ProfileSettingItem({
    super.key,
    required this.icon,
    required this.text,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: AppSpacing.smallPadding,
      decoration: BoxDecoration(
        color: Theme.of(context)
            .bottomNavigationBarTheme
            .backgroundColor
            ?.withOpacity(0.7),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).iconTheme.color!,
          width: 1.0,
        ),
        boxShadow: [
          BoxShadow(
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
                if (value.isNotEmpty) MiddleTextWidget(text: value),
              ],
            ),
          ),
          const SizedBox(width: 5),
        ],
      ),
    );
  }
}
