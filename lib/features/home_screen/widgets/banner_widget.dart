import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:mata_online_market/core/constants/app_dimension.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BannerWidget extends StatefulWidget {
  const BannerWidget({super.key});

  @override
  State<BannerWidget> createState() => _BannerWidgetState();
}

class _BannerWidgetState extends State<BannerWidget> {
  final urlImages = [
    'assets/images/1.jpg',
    'assets/images/2.jpg',
    'assets/images/3.jpg',
    'assets/images/4.jpg',
  ];

  int carouselActiveIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: urlImages.length,
          options: CarouselOptions(
              initialPage: 0,
              height: 190.0,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 2),
              enableInfiniteScroll: true,
              viewportFraction: 1.0,
              onPageChanged: (index, reason) {
                setState(() {
                  carouselActiveIndex = index;
                });
              }),
          itemBuilder: (
            context,
            index,
            realIndex,
          ) {
            final urlImage = urlImages[index];
            return _buildImage(urlImage, index);
          },
        ),
        const SizedBox(height: 10),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildImage(String urlImage, int index) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.asset(
          urlImage,
          fit: BoxFit.cover,
          width: AppDimensions.screenWidth80(context).width,
        ),
      );

  Widget _buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: carouselActiveIndex,
        count: urlImages.length,
        effect: ExpandingDotsEffect(
          activeDotColor: Theme.of(context).textTheme.bodyLarge!.color!,
          radius: 8,
          spacing: 10,
          dotHeight: 9,
          dotWidth: 9,
        ),
      );
}
