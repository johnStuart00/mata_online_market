import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mata_online_market/core/widgets/search_field_widget.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                // Search Field
                const Expanded(
                  child: SearchFieldWidget(),
                ),
                const SizedBox(width: 8.0),
                // Clear Button
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    Get.toNamed('/', preventDuplicates: true);
                  },
                ),
              ],
            ),
            // Additional UI or search results can be added here
          ],
        ),
      ),
    );
  }
}
