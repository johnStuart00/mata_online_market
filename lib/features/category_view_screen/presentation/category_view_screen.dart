import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/middle_text_widget.dart';
import 'package:collection/collection.dart';

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

const List<String> list = <String>['Ahlisi'];

class DropdownMenuExample extends StatefulWidget {
  const DropdownMenuExample({super.key});

  @override
  State<DropdownMenuExample> createState() => _DropdownMenuExampleState();
}

typedef MenuEntry = DropdownMenuEntry<String>;

class _DropdownMenuExampleState extends State<DropdownMenuExample> {
  static final List<MenuEntry> menuEntries = UnmodifiableListView<MenuEntry>(
    list.map<MenuEntry>((String name) => MenuEntry(value: name, label: name)),
  );
  String dropdownValue = list.first;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: DropdownMenu<String>(
        initialSelection: list.first,
        onSelected: (String? value) {
          setState(() {
            dropdownValue = value!;
          });
        },
        dropdownMenuEntries: menuEntries,
        // menuStyle: MenuStyle(
        //   padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        //     EdgeInsets.zero, // Minimize padding
        //   ),
        //   surfaceTintColor: MaterialStateProperty.all(
        //       Colors.transparent), // Remove background tint
        //   elevation: MaterialStateProperty.all(0), // Remove shadow
        //   side: MaterialStateProperty.all(BorderSide.none), // Remove border
        // ),
        textStyle: TextStyle(fontSize: 10),
      ),
    );
  }
}

class _AppBarTitleField extends StatelessWidget {
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
        const DropdownMenuExample(),
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
          flex: 3,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
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
