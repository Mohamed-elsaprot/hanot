import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'order_state_item.dart';

class OrderStateContainer extends StatelessWidget {
  const OrderStateContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 15.h),
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: const Row(
        children: [
          OrderStateItem(title: 'تأكيد الطلب',colored: true,),
          OrderStateItem(title: 'تجهيز الطلب',colored: false,),
          OrderStateItem(title: 'توصيل الطلب',colored: false,),
          OrderStateItem(title: 'تم التسليم',colored: false,),
        ],
      ),
    );
  }
}
