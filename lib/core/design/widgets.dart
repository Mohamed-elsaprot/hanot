import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'app_styles.dart';

Widget cachedImage(String img,{BoxFit boxFit=BoxFit.fill,bool smallImage=false,bool slider = false,double? height=220,double? width=double.infinity}){
  return SizedBox(
    height: height!.h,
    width: width!.w,
    child: CachedNetworkImage(
      placeholder: (context, url) => Shimmer.fromColors(
        baseColor: Colors.black12,
        highlightColor: Colors.white12,
        child: Container(
          color: Colors.white,
          height: 200.h,width: 185.w,
        ),
      ),
      errorWidget: (context, url, error) => const Center(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline),
              Text(
                'No Image',
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      imageUrl: img,
      fit: boxFit,
    ),
  );
}

// PreferredSizeWidget customAppbar(){
//   return PreferredSize(
//     preferredSize: Size(double.infinity,90.h),
//     child: Padding(
//       padding: EdgeInsets.symmetric(horizontal: 20.w),
//       child: AppBar(),
//     ),
//   );
// }

Widget shimmerWidget({required double height,required double width,double? rad=0,EdgeInsetsGeometry? margin}){
  return Shimmer.fromColors(
    baseColor: Colors.black12,
    highlightColor: Colors.white12,
    child: Container(
      height: height.h,width: width.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(rad!.r),
        color: Colors.white,
      ),
      margin: margin,
    ),
  );
}

Widget loadingIndicator({double? rad=30,Color? color}){
  return Center(
    child: Container(
      margin: EdgeInsets.only(bottom: 5.h),
      height: rad!.h,
      child: LoadingIndicator(
        indicatorType: Indicator.ballRotateChase,
        colors:  [Styles.primary,color?? Styles.primary.withOpacity(.5),],
      ),
    ),
  );
}