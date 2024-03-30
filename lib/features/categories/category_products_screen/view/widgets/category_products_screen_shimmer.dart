import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/design/widgets.dart';

class CategoryProductsScreenShimmer extends StatelessWidget {
  const CategoryProductsScreenShimmer({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GridView.builder(
          padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 10.w),
          physics: const BouncingScrollPhysics(),
          itemCount: 10,
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 250.w,
            mainAxisExtent: 300.h,
            mainAxisSpacing: 5.h,
            crossAxisSpacing: 5.w,
          ), itemBuilder: (context,index){
        return shimmerWidget(height: 220.h, width: double.infinity);
      }),
    );
  }
}
