import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/home/models/HomeModelWithBannerItems/HomeModelWithBannerItems.dart';
import 'package:page_view_dot_indicator/page_view_dot_indicator.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/widgets.dart';

class SliderContainer extends StatefulWidget {
  const SliderContainer({Key? key, required this.homeModelWithBannerItems}) : super(key: key);
  final HomeModelWithBannerItems homeModelWithBannerItems;

  @override
  State<SliderContainer> createState() => _SliderState();
}

class _SliderState extends State<SliderContainer> {
  int pointer = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.only(bottom: 5.h),
      child: Column(
        children: [
          SizedBox(
            height: 150.h,width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CarouselSlider.builder(
                itemCount: widget.homeModelWithBannerItems.bannerItem!.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: EdgeInsets.only(left: 20.w,right: 20.w,bottom: 15.h),
                    // child: cachedImage(widget.homeModelWithBannerItems.bannerItem![index].path??'',rad: 25),
                    child: cachedImage('https://graphicsfamily.com/wp-content/uploads/edd/2023/05/Website-Food-Banner-Design-1180x664.jpg'??'',rad: 25),
                  );
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
            ),
          ),
          PageViewDotIndicator(
            currentItem: pointer,
            count: widget.homeModelWithBannerItems.bannerItem!.length,
            size: const Size(8, 8),
            unselectedColor: Colors.grey.shade200 ,
            selectedColor: Styles.primary,
          ),
          SizedBox(height: 10.h,)
        ],
      ),
    );
  }
}
