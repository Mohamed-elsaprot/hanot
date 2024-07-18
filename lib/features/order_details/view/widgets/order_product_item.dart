import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/features/order_details/models/SingleOrderDetails.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/widgets.dart';

class OrderProductItem extends StatelessWidget {
  const OrderProductItem({Key? key, required this.singleOrderItem}) : super(key: key);
  final SingleOrderItem singleOrderItem;
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
          cachedImage(singleOrderItem.image??'',width: 130,height: 100,rad: 10),
          SizedBox(width: 8.w,),
          Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Styles.text(singleOrderItem.name??'',size: 11),
                  SizedBox(height: 8.h,),
                  Styles.subTitle(singleOrderItem.categories![0]??''),
                  SizedBox(height: 8.h,),
                  Styles.text('${singleOrderItem.quantity} قطعة',size: 10),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      Styles.text('السعر: ',size: 12,color: Styles.primary),
                      Styles.text('${singleOrderItem.salePrice} ${Texts.currency}',size: 12),
                      Styles.text(' x ',size: 12),
                      Styles.text('${singleOrderItem.quantity} ',size: 12),
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      Styles.text('الاجمالي:',size: 12,color: Styles.primary),
                      Styles.text('${singleOrderItem.quantity! * singleOrderItem.salePrice!} ${Texts.currency}',size: 12),
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
