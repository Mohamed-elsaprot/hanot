import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/design/widgets_fun.dart';

class SettingsShimmer extends StatelessWidget {
  const SettingsShimmer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        children: [
          SizedBox(height: 10.h,),
          shimmerWidget(height: 45.h, width: double.infinity,rad: 10),
          SizedBox(height: 10.h,),
          shimmerWidget(height: 320.h, width: double.infinity,rad: 10),
        ],
      ),
    );
  }
}
