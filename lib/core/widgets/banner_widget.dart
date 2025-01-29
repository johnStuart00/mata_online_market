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
    // 'https://trade.com.tm/media/images/b1ca32ae-42e0-4906-8066-401e08ed577d.jpg',
    // 'https://berkarar.com.tm/storage/app/uploads/public/64e/89b/eb0/64e89beb0d716009313890.jpg',
    // 'https://dostawkabar.com.tm/media/menu/on_plate/thumbnails/6_0E7ahrY.jpg.250x250_q85_crop-smart_watermark-logo.jpg',
    // 'https://dostawkabar.com.tm/media/menu/on_plate/thumbnails/25_J17ZWo3.jpg.250x250_q85_crop-smart_watermark-logo.jpg',
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
              height: 150.0,
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
