import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../../../../core/design/widgets_fun.dart';
import '../../models/HomeModelWithBannerItems/HomeModelWithBannerItems.dart';

class BannerSlider extends StatefulWidget {
  const BannerSlider({Key? key, this.homeModelWithBannerItems, this.images,}) : super(key: key);
  final HomeModelWithBannerItems? homeModelWithBannerItems;
  final List<String>? images;
  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  int pointer = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount:widget.images!=null? widget.images!.length :
          widget.homeModelWithBannerItems!.bannerItem!.length,
          itemBuilder: (context, index, realIndex) {
            return
              widget.images!=null?
                cachedImage(widget.images![index]??'',height: 480) :
                cachedImage(widget.homeModelWithBannerItems!.bannerItem![index].path??'',height: 270);
          },
          options: CarouselOptions(
              viewportFraction: 1,
              height: widget.images!=null?480.h:270.h,
              enlargeCenterPage: true,
              autoPlay: true,
              autoPlayInterval: const Duration(seconds: 6),
              autoPlayCurve: Curves.easeInOutCubic,
              reverse: true,
              onPageChanged: (x, _) {
                setState(() => pointer = x);
              }),
        ),
        if(widget.images!=null)Positioned(
          bottom: 10.h,
          child: Container(
            alignment: Alignment.center,
            width: MediaQuery.of(context).size.width,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white
              ),
              padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 4),
              child: AnimatedSmoothIndicator(
                activeIndex: pointer,
                count: widget.images!.length,
                effect: WormEffect(dotHeight: 12,dotWidth: 12,spacing: 12.w,activeDotColor: Colors.black,strokeWidth: 2,paintStyle: PaintingStyle.stroke),
              ),
            ),
          ).animate().fade(duration: const Duration(milliseconds: 400)),
        )
      ],
    );
  }
}
// Positioned.fill(
//   top: 270.h,
//     child: Container(
//       decoration: const BoxDecoration(
//           gradient: LinearGradient(
//               begin: Alignment.bottomCenter,
//               end: Alignment.topCenter,
//               colors: [
//                 Colors.black45,
//                 Colors.transparent
//               ]
//           )
//       ),
//
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 12),
//           child: Row(
//             children: [
//               Styles.text('New season styles',color: Colors.white),
//               const Spacer(),
//               Styles.text('Shop women\'s',color: Colors.white,textDecoration: TextDecoration.underline,fontWeight: FontWeight.w500),
//             ],
//           ),
//       ),
//     )
// )