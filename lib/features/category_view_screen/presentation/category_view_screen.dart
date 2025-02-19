import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/middle_text_widget.dart';

class CategoryViewScreen extends StatefulWidget {
  const CategoryViewScreen({super.key});

  @override
  State<CategoryViewScreen> createState() => _CategoryViewScreenState();
}

class _CategoryViewScreenState extends State<CategoryViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          //AppBar field start
          SliverAppBar(
            pinned: true,
            automaticallyImplyLeading: false,
            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: const _AppBarField(),
              title: _AppBarTitleField(),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 1000)),
          //AppBar field end

          const SliverToBoxAdapter(child: SizedBox(height: 100)),
        ],
      ),
    );
  }
}

class _AppBarTitleField extends StatefulWidget {
  @override
  State<_AppBarTitleField> createState() => _AppBarTitleFieldState();
}

class _AppBarTitleFieldState extends State<_AppBarTitleField> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(width: 5),
        GestureDetector(
          onTap: () {
            Get.toNamed('/', preventDuplicates: true);
          },
          child: const Icon(AppIcons.arrowBack),
        ),
        const SizedBox(width: 10),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            MiddleTextWidget(text: "Category Name"),
          ],
        ),
        const SizedBox(width: 5),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              DropdownButton(
                items: const [
                  DropdownMenuItem(
                    child: MiddleTextWidget(text: 'Ahlisi'),
                  ),
                ],
                onChanged: (value) {},
                underline: Container(height: 0),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
        const SizedBox(width: 5),
      ],
    );
  }
}

class _AppBarField extends StatelessWidget {
  const _AppBarField();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 2,
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: AppSpacing.cardPadding,
            decoration: BoxDecoration(
              image: const DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage('assets/images/1.jpg'),
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
          ),
        ),
        const Expanded(flex: 1, child: Center())
      ],
    );
  }
}
