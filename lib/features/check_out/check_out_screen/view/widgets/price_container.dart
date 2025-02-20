import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_state.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_state.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/design/images.dart';
import '../../../../../core/local_storage/secure_storage.dart';
import 'custom_continer.dart';

class PriceContainer extends StatelessWidget {
  const PriceContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var shippingFeestCubit = BlocProvider.of<ShippingFeesCubit>(context);
    var couponCubit = BlocProvider.of<CouponCubit>(context);
    return CustomContainer(
        body:[
          Row(
            children: [
              Image.asset(Images.priceLogo),
              SizedBox(width: 6.w,),
              Styles.text(textsMap['mobile_costSummary']),
            ],
          ),
          Divider(height: 14.h),
          Row(
            children: [
              Styles.subTitle(textsMap['mobile_productsCount'],size: 15),
              const Spacer(),
              Styles.text(cartCubit.cartLen.toString()),
            ],
          ),
          SizedBox(height: 6.h,),
          BlocBuilder<CouponCubit,CouponState>(builder: (context,state){
            return couponCubit.couponDiscount!=0?Row(
              children: [
                Styles.subTitle(textsMap['mobile_Discounts'],size: 15),
                const Spacer(),
                Styles.text('${couponCubit.couponDiscount??0} ${SecureStorage.currency}',color: Colors.red),
              ],
            ):const SizedBox();
          }),
          SizedBox(height: 6.h,),
          Row(
            children: [
              Styles.subTitle(textsMap['mobile_productsPrice'],size: 15),
              const Spacer(),
              Styles.text('${cartCubit.cartTotal} ${SecureStorage.currency}'),
            ],
          ),
          SizedBox(height: 6.h,),
          BlocBuilder<ShippingFeesCubit,ShippingFeesState>(builder: (context,state){
            return Row(
              children: [
                Styles.subTitle(textsMap['mobile_Shipping_Fees'],size: 15),
                const Spacer(),
                Styles.text('${shippingFeestCubit.shippingFeesModel?.shippingFees??0} ${SecureStorage.currency}'),
              ],
            );
          }),

        ]
    );
  }
}
