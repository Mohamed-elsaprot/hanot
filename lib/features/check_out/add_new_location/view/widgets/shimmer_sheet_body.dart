import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets.dart';

import '../../../../../core/design/appTexts.dart';
import '../../../../../core/design/app_styles.dart';

class ShimmerSheetBody extends StatelessWidget {
  const ShimmerSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 410.h,
      child: Column(
        children: [
          AppBar(
            title: Styles.text(Texts.addNewLocation, size: 22).tr(),
            leading: InkWell(
                onTap: ()=>Navigator.pop(context),
                child: const Icon(Icons.close)),
          ),
          Expanded(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 20.h),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(flex: 1, child: shimmerWidget(height: 40.h, rad: 6,width: 50)),
                      SizedBox(width: 20.w,),
                      Expanded(flex: 1, child: shimmerWidget(height: 40.h, rad: 6,width: 50)),
                    ],
                  ),
                  SizedBox(height: 20.h,),
                  shimmerWidget(height: 36.h, rad: 6,width: double.infinity),
                  SizedBox(height: 20.h,),
                  shimmerWidget(height: 36.h, rad: 6,width: double.infinity),
                  SizedBox(height: 20.h,),
                  shimmerWidget(height: 36.h, rad: 6,width: double.infinity),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Expanded(flex: 1, child: shimmerWidget(height: 40.h, rad: 6,width: 50)),
                      SizedBox(width: 20.w,),
                      Expanded(flex: 1, child: shimmerWidget(height: 40.h, rad: 6,width: 50)),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
