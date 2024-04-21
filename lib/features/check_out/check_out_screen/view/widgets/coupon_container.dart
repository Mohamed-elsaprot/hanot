import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/design/fun.dart';
import '../../../../../general_widgets/custom_button.dart';
import 'code_sheet_body.dart';


class CouponContainer extends StatelessWidget {
  const CouponContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey.shade200
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.text('هل لديك كوبون؟',),
              Styles.text('EID2024',),
            ],
          ),
          const Spacer(),
          CustomButton(fun: (){
            bottomSheet(context, const CodeSheetBody(),);
          }, title: 'تطبيق',rad: 6,padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 6.h),)
        ],
      ),
    );
  }
}
