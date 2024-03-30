import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hanot/features/home/models/HomeModelWithBannerItems/HomeModelWithBannerItems.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/widgets.dart';

class SliderStack extends StatefulWidget {
  const SliderStack({Key? key, required this.homeModelWithBannerItems}) : super(key: key);
  final HomeModelWithBannerItems homeModelWithBannerItems;

  @override
  State<SliderStack> createState() => _SliderStackState();
}

class _SliderStackState extends State<SliderStack> {
  int pointer = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.homeModelWithBannerItems.bannerItem!.length,
          itemBuilder: (context, index, realIndex) {
            return cachedImage(widget.homeModelWithBannerItems.bannerItem![index].path??'');
          },
          options: CarouselOptions(
              viewportFraction: 1,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              autoPlayCurve: Curves.easeInOutCubic,
              reverse: true,
              onPageChanged: (x, _) {
                setState(() => pointer = x);
              }),
        ),
        Positioned(
            bottom: 10,
            child: PageViewDotIndicator(
              currentItem: pointer,
              count: widget.homeModelWithBannerItems.bannerItem!.length,
              size: const Size(8, 8),
              unselectedColor: Styles.primary.withOpacity(.5),
              selectedColor: Colors.white,
            )),
      ],
    );
  }
}
