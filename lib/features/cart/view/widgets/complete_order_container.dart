import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../general_widgets/custom_button.dart';

class CompleteOrderContainer extends StatelessWidget {
  const CompleteOrderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12),bottom: BorderSide(color: Colors.black12))
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 8.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // const SelectAllButton(),
          BlocBuilder<CartCubit,CartState>(builder: (context,state){
            return Styles.text('${textsMap['mobile_Total']} ${cartCubit.cartTotal} ${Texts.currency}',size: 13);
          }),
          BlocBuilder<CartCubit,CartState>(builder: (context,state){
            return CustomButton(
                padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 6.h,),
                rad: 50,
                fun: () {
                  AppRouter.router.push(AppRouter.checkOutScreen);
                },
                textSize: 12,
                title: '${textsMap['mobile_complete_order']} (${cartCubit.cartProductsList.length})');
          }),

        ],
      ),
    );
  }
}
