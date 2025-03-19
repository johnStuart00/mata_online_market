import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mata_online_market/config/routes/route_helper.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/icon_container_widget.dart';
import 'package:mata_online_market/features/home_screen/widgets/search_field_widget.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController _searchController = TextEditingController();
  late Box<String> searchBox;

  @override
  void initState() {
    super.initState();
    searchBox = Hive.box<String>('searchHistory');
  }

  void _saveSearchQuery(String query) {
    if (query.trim().isNotEmpty) {
      searchBox.add(query);
      _searchController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(AppLocalizations.of(context)!.gozlegSahypa),
      ),
      body: Padding(
        padding: AppSpacing.screenPadding,
        child: Column(children: [
          // Search Field start
          Row(
            children: [
              Expanded(
                child: SearchFieldWidget(
                  searchController: _searchController,
                  saveSearchQuery: _saveSearchQuery,
                ),
              ),
              const SizedBox(width: 8.0),
              GestureDetector(
                onTap: () {
                  Get.toNamed(
                    RouteHelper.initialRoute,
                    preventDuplicates: true,
                  );
                },
                child: const IconWidget(icon: AppIcons.close),
              ),
            ],
          ),
          // Search Field end
          const SizedBox(height: 16.0),
          // Display Search History field start
          Expanded(
            child: ValueListenableBuilder(
              valueListenable: searchBox.listenable(),
              builder: (context, Box<String> box, _) {
                if (box.isEmpty) {
                  return const Center(
                    child: Text('No search history.'),
                  );
                }
                return ListView.builder(
                  itemCount: box.length,
                  itemBuilder: (context, index) {
                    final searchQuery = box.getAt(index);
                    return ListTile(
                        title: Text(searchQuery ?? ''),
                        trailing: GestureDetector(
                          onTap: () {
                            box.deleteAt(index);
                          },
                          child: const IconWidget(
                            icon: AppIcons.delete,
                          ),
                        ));
                  },
                );
              },
            ),
          ),
          // Display Search History field end
        ]),
      ),
    );
  }
}
