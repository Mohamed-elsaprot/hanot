import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_state.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_state.dart';

import '../../../../../core/design/appTexts.dart';
import '../../../../../core/design/app_styles.dart';
import '../../../../../core/design/images.dart';
import 'custom_continer.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var shippingFeestCubit = BlocProvider.of<ShippingFeesCubit>(context);
    var couponCubit = BlocProvider.of<CouponCubit>(context);
    return CustomContainer(
        body:[
          Row(
            children: [
              Image.asset(Images.priceLogo),
              SizedBox(width: 6.w,),
              Styles.text(Texts.costSummary.tr()),
            ],
          ),
          Divider(height: 14.h),
          Row(
            children: [
              Styles.subTitle(Texts.productsCount.tr(),size: 15),
              const Spacer(),
              Styles.text(cartCubit.cartLen.toString()),
            ],
          ),
          SizedBox(height: 6.h,),
          BlocBuilder<CouponCubit,CouponState>(builder: (context,state){
            return Row(
              children: [
                Styles.subTitle(Texts.discounts.tr(),size: 15),
                const Spacer(),
                Styles.text('${couponCubit.couponDiscount??0} ${Texts.currency.tr()}'),
              ],
            );
          }),
          SizedBox(height: 6.h,),
          Row(
            children: [
              Styles.subTitle(Texts.productsPrice.tr(),size: 15),
              const Spacer(),
              Styles.text('${cartCubit.cartTotal} ${Texts.currency}'),
            ],
          ),
          SizedBox(height: 6.h,),
          BlocBuilder<ShippingFeesCubit,ShippingFeesState>(builder: (context,state){
            return Row(
              children: [
                Styles.subTitle(Texts.shippingFees.tr(),size: 15),
                const Spacer(),
                Styles.text('${shippingFeestCubit.shippingFeesModel?.shippingFees??0} ${Texts.currency}'),
              ],
            );
          }),

        ]
    );
  }
}
