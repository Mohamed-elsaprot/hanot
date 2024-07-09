import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class OrderPriceContainer extends StatelessWidget {
  const OrderPriceContainer({Key? key}) : super(key: key);

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
              Image.asset(Images.priceLogo),
              SizedBox(width: 10.w,),
              Styles.text('المنتجات')
            ],
          ),
          Divider(height: 30.h,color: Colors.black26,),
          priceRow('عدد المنتجات', 1),
          priceRow('سعر المنتجات', 265.00),
          priceRow('الخصومات', 10.00),
          priceRow('رسوم التوصيل', 50),
          priceRow('الضريبة المضافة 15%', 15),
          Divider(height: 30.h,color: Colors.black26,),
          priceRow('السعر الاجمالي', 15,main: true),

        ],
      ),
    );
  }
  
  Widget priceRow(String title,num price,{bool? main=false}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Styles.text(title,color:main!?Colors.black :Colors.black26),
          const Spacer(),
          Styles.text('$price ر.س'),
        ],
      ),
    );
  }
}
