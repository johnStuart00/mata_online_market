import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';

class SearchFieldWidget extends StatefulWidget {
  final TextEditingController searchController;
  final Function saveSearchQuery;
  const SearchFieldWidget({
    Key? key,
    required this.searchController,
    required this.saveSearchQuery,
  }) : super(key: key);

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.widgetHorizontalPadding,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          const Icon(
            AppIcons.search,
            size: 22,
          ),
          const SizedBox(
            width: 3,
          ),
          Expanded(
            child: TextField(
              controller: widget.searchController,
              onSubmitted: (query) {
                widget.saveSearchQuery(query);
              },
              decoration: InputDecoration(
                fillColor: Theme.of(context).cardColor,
                border: InputBorder.none,
                hintText: AppLocalizations.of(context)!.harytlaryGozlan,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
