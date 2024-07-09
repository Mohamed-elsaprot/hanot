import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/router.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class OrderContainer extends StatelessWidget {
  const OrderContainer({Key? key, required this.index}) : super(key: key);
  final int index;
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
              Image.asset(Images.orderIcon,width: 40.w,),
              SizedBox(width: 10.w,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Styles.text('رقم الطلب : 2578951235'),
                  SizedBox(height: 4.h,),
                  Styles.subTitle('تاريخ الطلب : 16 أكتوبر 2022 - 10:00 صباحاً',size: 11),
                ],
              )
            ],
          ),
          Divider(height: 40.h,),
          Row(
            children: [
              Styles.text('حالة الطلب : ',color: Colors.black54,size: 12),
              if(index==0)Styles.text('فى انتظار تأكيد الطلب',size: 12,color: Colors.orangeAccent),
              if(index==1)Styles.text('جاري تجهيز الطلب',size: 12,color: Colors.green),
              if(index==2)Styles.text('في الطريق اليك',size: 12,color: Colors.blueAccent),
              if(index==3)Styles.text('تم التسليم',size: 12,color: Colors.green),
              if(index==4)Styles.text('تم الالغاء',size: 12,color: Colors.red),
              const Spacer(),
              GestureDetector(
                  onTap: (){
                    AppRouter.router.push(AppRouter.orderDetails);
                  },
                  child: Styles.text('عرض التفاصيل',size: 12)),
            ],
          )
        ],
      ),
    );
  }
}
