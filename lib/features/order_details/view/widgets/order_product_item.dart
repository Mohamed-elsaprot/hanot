import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/order_details/models/SingleOrderDetails.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/widgets_fun.dart';
import '../../../../core/local_storage/secure_storage.dart';
import '../../../lang/manager/lang_cubit.dart';

class OrderProductItem extends StatelessWidget {
  const OrderProductItem({Key? key, required this.singleOrderItem}) : super(key: key);
  final SingleOrderItem singleOrderItem;
  @override
  Widget build(BuildContext context) {
    var langCubit =BlocProvider.of<LangCubit>(context);
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
                  Styles.text(singleOrderItem.name??'No Name',size: 11),
                  // if(singleOrderItem.categories?[0]!=null)SizedBox(height: 8.h,),
                  // if(singleOrderItem.categories?[0]!=null)Styles.subTitle(singleOrderItem.categories![0]),
                  SizedBox(height: 8.h,),
                  Styles.text('${singleOrderItem.quantity} ${langCubit.texts['mobile_piece_lable']}',size: 10),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      Styles.text('${langCubit.texts['mobile_price_label']}: ',size: 12,color: Styles.primary),
                      Styles.text('${singleOrderItem.salePrice} ${SecureStorage.currency}',size: 12),
                      Styles.text(' x ',size: 12),
                      Styles.text('${singleOrderItem.quantity} ',size: 12),
                    ],
                  ),
                  SizedBox(height: 8.h,),
                  Row(
                    children: [
                      Styles.text('${langCubit.texts['mobile_Total_with_out_comma']}: ',size: 12,color: Styles.primary),
                      Styles.text('${singleOrderItem.quantity! * singleOrderItem.salePrice!} ${SecureStorage.currency}',size: 12),
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
