import 'package:flutter/material.dart';
import 'package:mata_online_market/core/widgets/text_widgets/small_text_widget.dart';

class CircleContainerWidget extends StatelessWidget {
  final String imageUrl;
  final String categoryName;

  const CircleContainerWidget(
      {super.key, required this.imageUrl, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            width: 50.0,
            height: 50.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(imageUrl),
              ),
            ),
          ),
          const SizedBox(height: 2.0),
          SmallTextWidget(text: categoryName)
        ],
      ),
    );
  }
}
