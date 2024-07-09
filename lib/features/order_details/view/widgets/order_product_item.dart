import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/widgets.dart';

class OrderProductItem extends StatelessWidget {
  const OrderProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.black26),
          borderRadius: BorderRadius.circular(15)
      ),
      padding: const EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(vertical: 6.h),
      child: Row(
        children: [
          cachedImage('https://cdn.thewirecutter.com/wp-content/media/2023/11/drills-2048px-8368.jpg?auto=webp&quality=75&width=1024',width: 130,height: 100,rad: 10),
          SizedBox(width: 8.w,),
          Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Styles.text('طقم حدادة لجميع مهندسين الصيانة',size: 11),
                  SizedBox(height: 8.h,),
                  Styles.subTitle('منتجات كهربائية'),
                  SizedBox(height: 8.h,),
                  Styles.text('12 قطعة',size: 10),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      Styles.text('السعر:',size: 12,color: Styles.primary),
                      Styles.text('2 x 200 ر.س',size: 12),
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      Styles.text('الاجمالي:',size: 12,color: Styles.primary),
                      Styles.text('400 ر.س',size: 12),
                    ],
                  )
                ],
              )
          )
        ],
      ),
    );
  }
}
