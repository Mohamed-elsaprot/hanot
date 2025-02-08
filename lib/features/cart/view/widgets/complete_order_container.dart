import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/core/design/widgets_fun.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/auth_screen/view/phone/auth_screen.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_state.dart';
import 'package:hanot/features/cart/manager/check_cart_cubit/check_cart_cubit.dart';
import 'package:hanot/features/cart/manager/check_cart_cubit/check_cart_state.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/local_storage/secure_storage.dart';
import '../../../../general_widgets/custom_button.dart';

class CompleteOrderContainer extends StatelessWidget {
  const CompleteOrderContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cartCubit = BlocProvider.of<CartCubit>(context);
    var authCubit = BlocProvider.of<AuthCubit>(context);
    var checkCartCubit = BlocProvider.of<CheckCartCubit>(context);
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
            return Styles.text('${textsMap['mobile_Total']} ${cartCubit.cartTotal} ${SecureStorage.currency}',size: 13);
          }),
          BlocBuilder<CartCubit,CartState>(builder: (context,state){
            return BlocConsumer<CheckCartCubit,CheckCartState>(
                builder: (context,state){
                  if(state is CheckCartLoading){
                    return Container(
                      height: 30.h,
                      margin: EdgeInsets.only(bottom: 3.h),
                      child: CustomButton(
                        fun: (){}, title: '',rad: 50, padding: EdgeInsets.symmetric(horizontal: 60.w,vertical: 4.h,),
                        titleWidget: loadingIndicator(color: Colors.white),
                      ),
                    );
                  }else{
                    return CustomButton(
                        padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 6.h,), rad: 50,
                        fun: () {
                          authCubit.isAuth?
                          checkCartCubit.checkCart() : bottomSheet(context, const AuthScreen());
                        },
                        textSize: 12,
                        title: '${textsMap['mobile_complete_order']} (${cartCubit.cartProductsList.length})');
                  }
            }, listener: (context,state){
                  if(state is CheckCartSuccess)
                    if (state.check) AppRouter.router.push(AppRouter.checkOutScreen);
                  if(state is CheckCartFailure) errorDialog(context: context, message: state.errorMessage);


            });
          }),

        ],
      ),
    );
  }
}
