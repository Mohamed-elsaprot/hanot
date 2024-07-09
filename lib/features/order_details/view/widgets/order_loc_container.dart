import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class OrderLocContainer extends StatelessWidget {
  const OrderLocContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white
      ),
      padding: const EdgeInsets.all(15),
      margin: EdgeInsets.symmetric(horizontal: 15.w,vertical: 6.h),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(Images.locIcon,width: 22.w,),
              SizedBox(width: 10.w,),
              Styles.text('عنوان التواصل')
            ],
          ),
          Divider(height: 30.h,color: Colors.black26,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.text('محمد مصطفي'),
              SizedBox(height: 6.h,),
              Styles.subTitle('جدة فرع حي الكندرة ـ الكندرة شارع الملك فهد (الستين) مقابل سوق اليمامة.',size: 14),
            ],
          )
        ],
      ),
    );
  }
}
