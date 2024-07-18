import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/design/widgets.dart';

class CategoryProductsScreenShimmer extends StatelessWidget {
  const CategoryProductsScreenShimmer({Key? key, this.padding=10,}) : super(key: key);
  final double? padding;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.builder(
          padding: EdgeInsets.symmetric(vertical: padding!.h,horizontal: padding!.w),
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250.w,
            mainAxisExtent: 235.h,
            mainAxisSpacing: 14.h,
            crossAxisSpacing: 14.w,
          ), itemBuilder: (context,index){
        return shimmerWidget(height: 235.h, width: double.infinity,rad: 8);
      }),
    );
  }
}
