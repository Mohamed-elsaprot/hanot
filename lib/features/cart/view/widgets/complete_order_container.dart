import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/auth_screen/view/phone/phone_auth_screen.dart';
import 'package:hanot/features/cart/manager/cart_cubit.dart';
import 'package:hanot/features/cart/manager/cart_state.dart';
import 'package:hanot/features/cart/view/widgets/code_sheet_body.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../general_widgets/custom_button.dart';
import '../../../auth_screen/manager/auth_cubit.dart';

class CompleteOrderContainer extends StatelessWidget {
  const CompleteOrderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          InkWell(
            onTap: (){
              bottomSheet(context, const CodeSheetBody(),rad: 30);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Styles.text(Texts.doYouHaveCoupon,color: Colors.black.withOpacity(.7),size: 15).tr(),
                Divider(color: Colors.black.withOpacity(.7),height: 0,endIndent: 250,thickness: 1.5,)
              ],
            ),
          ),
          Divider(color: Colors.black54,height: 25.h,),
          BlocBuilder<CartCubit,CartState>(builder: (context,state){
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Styles.text('',color: Colors.black54,size: 18),
                Styles.text('${cartCubit.calcTotal()} PLN',color: Colors.black54,size: 18),
              ],
            );
          }),
          SizedBox(height: 6.h,),
          SizedBox(
              width: double.infinity,
              child: CustomButton(
                  rad: 12,padding: EdgeInsets.symmetric(vertical: 8.h),
                  fun: (){
                    if(!authCubit.isAuth)bottomSheet(context, const AuthScreen(), rad: 20);
                  }, title: Texts.completeOrder.tr()))
        ],
      ),
    );
  }
}
