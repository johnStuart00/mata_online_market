import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/widgets/search_field_widget.dart';

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
    return SafeArea(
      top: true,
      bottom: true,
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16.0),
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
                IconButton(
                  icon: const Icon(AppIcons.close),
                  onPressed: () {
                    Get.toNamed('/', preventDuplicates: true);
                  },
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
                        // trailing: IconButton(
                        //   icon: const Icon(Icons.delete),
                        //   onPressed: () => box.deleteAt(index),
                        // ),
                      );
                    },
                  );
                },
              ),
            ),
            // Display Search History field end
          ]),
        ),
      ),
    );
  }
}
