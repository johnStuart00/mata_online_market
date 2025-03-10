import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mata_online_market/core/assets/app_icons.dart';
import 'package:mata_online_market/core/constants/app_dimension.dart';
import 'package:mata_online_market/core/constants/app_spacing.dart';
import 'package:mata_online_market/core/widgets/icon_container_widget.dart';

class ProductImageCarousel extends StatefulWidget {
  final bool liked;
  const ProductImageCarousel({super.key, required this.liked});

  @override
  State<ProductImageCarousel> createState() => _ProductImageCarouselState();
}

class _ProductImageCarouselState extends State<ProductImageCarousel> {
  final List<String> imageUrls = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  int _currentIndex = 0;

  bool isLiked = false;

  void _toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Stack(
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 300.0,
                enlargeCenterPage: true,
                aspectRatio: 16 / 9,
                onPageChanged: (index, reason) {
                  setState(() {
                    _currentIndex = index;
                  });
                },
              ),
              items: imageUrls.map((url) {
                return ClipRRect(
                  borderRadius: AppSpacing.cardRadius,
                  child: Image.asset(
                    url,
                    fit: BoxFit.cover,
                    width: 1000.0,
                  ),
                );
              }).toList(),
            ),
            Positioned(
              bottom: 15.0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageUrls.asMap().entries.map((entry) {
                  return Container(
                    width: 10.0,
                    height: 10.0,
                    margin: const EdgeInsets.symmetric(horizontal: 4.0),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentIndex == entry.key
                          ? Theme.of(context).textTheme.bodyLarge!.color!
                          // ignore: deprecated_member_use
                          : Colors.grey.withOpacity(0.5),
                    ),
                  );
                }).toList(),
              ),
            ),
            Positioned(
              bottom: 0.0,
              right: AppDimensions.screenWidth(context) * 0.15,
              child: GestureDetector(
                  onTap: () {
                    _toggleLike();
                  },
                  child: isLiked
                      ? const IconWidget(icon: AppIcons.liked)
                      : const IconWidget(icon: AppIcons.unliked)),
            ),
          ],
        ),
      ),
    );
  }
}
