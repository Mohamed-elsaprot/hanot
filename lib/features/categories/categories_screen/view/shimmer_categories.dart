import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/widgets.dart';

class ShimmerCategories extends StatelessWidget {
  const ShimmerCategories({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
        physics: const BouncingScrollPhysics(),
        itemCount: 30,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 140.w,
            mainAxisExtent: 130.h,
            mainAxisSpacing: 18,
            crossAxisSpacing: 10
        ),
        itemBuilder: (context,index)=>Column(
          children: [
            shimmerWidget(height: 100, width: 140,rad: 8),
            SizedBox(height: 6.h,),
            shimmerWidget(height: 10, width: 100,rad: 15)
          ],
        )
    );
  }
}
