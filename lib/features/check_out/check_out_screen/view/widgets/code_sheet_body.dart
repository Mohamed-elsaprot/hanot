import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/cart/view/widgets/coupon_text_field.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_state.dart';
import 'package:hanot/general_widgets/custom_button.dart';

import '../../../../../core/design/app_styles.dart';
import '../../manager/coupon_cubit/coupon_cubit.dart';

class CouponSheetBody extends StatefulWidget {
  const CouponSheetBody({Key? key, }) : super(key: key);
  @override
  State<CouponSheetBody> createState() => _CouponSheetBodyState();
}

class _CouponSheetBodyState extends State<CouponSheetBody> {
  double height = 180;
  FocusNode focusNode = FocusNode();
  late CouponCubit couponCubit ;
  @override
  void initState() {
    couponCubit = BlocProvider.of<CouponCubit>(context);
    couponCubit.couponController.text = couponCubit.couponCode;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.text(Texts.enterTheCoupon).tr(),
          SizedBox(height: 10.h,),
          CouponTextField(
              controller: couponCubit.couponController,
              focusNode: focusNode,
              onSubmit: (x){
                height = 180;setState(() {});
              },
              onTap: (){
            height=400;setState(() {});
          }),
          SizedBox(height: 15.h,),
          SizedBox(
            width: double.infinity,
            child: BlocBuilder<CouponCubit,CouponState>(builder: (context,state){
              if(state is CouponLoading){
                return CustomButton(fun: (){}, title: '',titleWidget: loadingIndicator(color: Colors.white,rad: 17),);
              }else{
                return CustomButton(fun: () async {
                  couponCubit.applyCouponAndUpdateCartTotal(coupon: couponCubit.couponController.text, context: context);
                },title: Texts.disCount.tr(),rad: 12,);
              }
            }),
          )
        ],
      ),
    );
  }
}
