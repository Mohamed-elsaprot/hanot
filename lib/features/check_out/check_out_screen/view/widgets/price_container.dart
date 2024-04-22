import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_state.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_state.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/price_row.dart';

import '../../../../cart/manager/cart_cubit/cart_cubit.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var shippingFeesCubit = BlocProvider.of<ShippingFeesCubit>(context);
    var couponCubit = BlocProvider.of<CouponCubit>(context);
    return BlocBuilder<ShippingFeesCubit,ShippingFeesState>(builder: (context,state){
      return BlocBuilder<CouponCubit,CouponState>(builder: (context,state){
        return Column(
          children: [
            PriceRow(title: 'اجمالي السلة',price: cartCubit.cartTotal,),
            // PriceRow(title: 'اجمالي التخفيض',price: 0,),
            PriceRow(title: 'تخفيض الكوبون',price: couponCubit.couponDiscount??0,),
            PriceRow(title: 'رسوم الشحن',price: shippingFeesCubit.shippingFeesModel?.shippingFees?? 0,),
            PriceRow(title: 'اجمالي الطلب',price: couponCubit.newTotal!=null?
            couponCubit.newTotal! + (shippingFeesCubit.shippingFeesModel?.shippingFees??0):
            shippingFeesCubit.shippingFeesModel?.total?? cartCubit.cartTotal, total: true),
          ],
        );
      });
    });
  }
}