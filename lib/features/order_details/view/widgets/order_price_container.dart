import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/features/order_details/models/single_order.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class OrderPriceContainer extends StatelessWidget {
  const OrderPriceContainer({Key? key, required this.singleOrder}) : super(key: key);
  final SingleOrder singleOrder;
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
          priceRow('عدد المنتجات', singleOrder.detailsList.length.toString()),
          priceRow('سعر المنتجات', '${double.tryParse(singleOrder.orderModel.subtotal!)??0} ${Texts.currency}'),
          priceRow('الخصومات', '${singleOrder.orderModel.discount??0} ${Texts.currency}'),
          priceRow('رسوم التوصيل','${singleOrder.orderModel.deliveryFee??0} ${Texts.currency}'),
          // priceRow('الضريبة المضافة 15%', 15),
          Divider(height: 30.h,color: Colors.black26,),
          priceRow('السعر الاجمالي', '${double.tryParse(singleOrder.orderModel.total!)??0} ${Texts.currency}',main: true),

        ],
      ),
    );
  }
  
  Widget priceRow(String title,String price,{bool? main=false}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Styles.text(title,color:main!?Colors.black :Colors.black26),
          const Spacer(),
          Styles.text(price),
        ],
      ),
    );
  }
}
