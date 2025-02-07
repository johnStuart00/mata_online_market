import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';

class SearchFieldWidget extends StatefulWidget {
  const SearchFieldWidget({
    super.key,
  });

  @override
  State<SearchFieldWidget> createState() => _SearchFieldWidgetState();
}

class _SearchFieldWidgetState extends State<SearchFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Theme.of(context).cardColor,
          border: InputBorder.none,
          hintText: AppLocalizations.of(context)!.harytlaryGozlan,
          prefixIcon: const Icon(
            AppIcons.search,
            size: 18,
          ),
          // suffix: SizedBox(
          //   width: 105,
          //   child: Row(
          //     children: [
          //       const Text(
          //         '|',
          //         style: TextStyle(
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //       IconButton(
          //         onPressed: () {},
          //         icon: const Icon(AppIcons.sort),
          //       ),
          //     ],
          //   ),
          // ),
        ),
      ),
    );
  }
}
