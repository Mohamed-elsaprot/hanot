import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/images.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:shimmer/shimmer.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'app_styles.dart';

Widget cachedImage(String img,{double? rad,BoxFit boxFit=BoxFit.fill,bool smallImage=false,bool slider = false,double? height=220,double? width=double.infinity}){
  return ClipRRect(
    borderRadius: BorderRadius.circular(rad??0),
    child: SizedBox(
      height: height!.h,
      width: width!.w,
      child: CachedNetworkImage(
        placeholder: (context, url) => Shimmer.fromColors(
          baseColor: Colors.black12,
          highlightColor: Colors.white12,
          child: Container(
            color: Colors.white,
            height: width.h,width: width.w,
          ),
        ),
        errorWidget: (context, url, error) {
          return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline),
            SizedBox(height: 8.h,),
            FittedBox(child: Styles.text('No Image Found',textAlign: TextAlign.center)),
          ],
        );
        },
        imageUrl: img,
        fit: boxFit,
      ),
    ),
  );
}

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