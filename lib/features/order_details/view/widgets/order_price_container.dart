import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/order_details/models/single_order.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';
import '../../../../core/local_storage/secure_storage.dart';
import '../../../lang/manager/lang_cubit.dart';

class OrderPriceContainer extends StatelessWidget {
  const OrderPriceContainer({Key? key, required this.singleOrder}) : super(key: key);
  final SingleOrder singleOrder;
  @override
  Widget build(BuildContext context) {
    var langCubit = BlocProvider.of<LangCubit>(context);
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
              Styles.text(langCubit.texts['mobile_products_label'])
            ],
          ),
          Divider(height: 30.h,color: Colors.black26,),
          priceRow(langCubit.texts['mobile_productsCount'], singleOrder.detailsList.length.toString()),
          priceRow(langCubit.texts['mobile_productsPrice'], '${singleOrder.orderModel.subtotal!} ${SecureStorage.currency}'),
          if(singleOrder.orderModel.discount!=0)
            priceRow(langCubit.texts['mobile_Discounts'], '${singleOrder.orderModel.discount??0} ${SecureStorage.currency}',c: Colors.red),
          priceRow(langCubit.texts['mobile_delivery_fees_label'],'${singleOrder.orderModel.deliveryFee??0} ${SecureStorage.currency}',),
          // priceRow('الضريبة المضافة 15%', 15),
          Divider(height: 30.h,color: Colors.black26,),
          priceRow(langCubit.texts['mobile_'], '${double.tryParse(singleOrder.orderModel.total!)??0} ${SecureStorage.currency}',main: true),

        ],
      ),
    );
  }
  
  Widget priceRow(String title,String price,{bool? main=false,Color c=Colors.black}){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        children: [
          Styles.text(title,color:main!?Colors.black :Colors.black26),
          const Spacer(),
          Styles.text(price,color: c),
        ],
      ),
    );
  }
}
