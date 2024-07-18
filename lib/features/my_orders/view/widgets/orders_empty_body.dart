import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class OrdersEmptyBody extends StatelessWidget {
  const OrdersEmptyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(Images.ordersEmpty,width: 200.w,),
        Styles.text('لا توجد طلبات جارية ',size: 18),
        SizedBox(height: 10.h,),
        Styles.subTitle('ليس لديك اى طلبات حالية عند القيام بطلب شراء',size: 14),
        Styles.subTitle('المنتجات سوف يظهر الطلب هنا.',size: 14),
      ],
    );
  }
}
