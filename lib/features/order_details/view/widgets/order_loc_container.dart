import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/features/my_orders/data/models/orders_model.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class OrderLocContainer extends StatelessWidget {
  const OrderLocContainer({Key? key, required this.orderModel}) : super(key: key);
  final MyOrderModel orderModel;
  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    String loc=orderModel.address!.city!;
    orderModel.address!.streetName!.isNotEmpty?loc+=' ,${orderModel.address!.streetName}':null;
    orderModel.address!.homeAddress!.isNotEmpty?loc+=' ,${orderModel.address!.homeAddress}':null;
    orderModel.address!.neighborhood!.isNotEmpty?loc+=' ,${orderModel.address!.neighborhood}':null;
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
              Image.asset(orderModel.deliveryMethod=='pick_up'?Images.selfDelivery:Images.locIcon,width: 22.w,),
              SizedBox(width: 10.w,),
              Styles.text(orderModel.deliveryMethod=='pick_up'?textsMap['mobile_selfPickUp']:textsMap['mobile_delivery_address'])
            ],
          ),
          Divider(height: 30.h,color: Colors.black26,),
          SizedBox(
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.text(orderModel.address!.city!),
                SizedBox(height: 6.h,),
                Styles.subTitle(loc,size: 14),
              ],
            ),
          )
        ],
      ),
    );
  }
}
