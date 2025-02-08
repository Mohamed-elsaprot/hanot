import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/features/order_details/models/single_order.dart';

import '../../../../core/design/app_styles.dart';
import 'order_product_item.dart';

class OrderProductsContainer extends StatelessWidget {
  const OrderProductsContainer({Key? key, required this.singleOrder}) : super(key: key);
  final SingleOrder singleOrder;
  @override
  Widget build(BuildContext context) {
    var langCubit =BlocProvider.of<LangCubit>(context);
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
              const Icon(CupertinoIcons.cube_fill,color: Styles.primary,),
              SizedBox(width: 10.w,),
              Styles.text(langCubit.texts['mobile_products_label'])
            ],
          ),
          Divider(height: 30.h,color: Colors.black26,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(singleOrder.detailsList.length, (index)=>  OrderProductItem(singleOrderItem: singleOrder.detailsList[index],)),
          )
        ],
      ),
    );
  }
}
