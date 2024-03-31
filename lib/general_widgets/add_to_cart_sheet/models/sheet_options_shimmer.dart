import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/widgets.dart';

class SheetOptionsShimmer extends StatelessWidget {
  const SheetOptionsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        shimmerWidget(height: 15.h, width: 100.w,rad: 12),
        SizedBox(height: 10.h,),
        shimmerWidget(height: 35.h, width: 155.w,rad: 12),
        SizedBox(height: 15.h,),
        shimmerWidget(height: 15.h, width: 100.w,rad: 12),
        SizedBox(height: 10.h,),
        shimmerWidget(height: 45.h, width: double.infinity,rad: 12),
        SizedBox(height: 12.h,),
        Row(
          children: [
            Expanded(flex: 1, child: shimmerWidget(height: 35.h, width: double.infinity,rad: 1000)),
            SizedBox(width: 15.w,),
            Expanded(flex: 6, child: shimmerWidget(height: 35.h, width: double.infinity,rad: 35)),
          ],
        ),
      ],
    );
  }
}
