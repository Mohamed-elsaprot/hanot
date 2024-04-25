import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/check_out_cubit/check_out_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/check_out_cubit/check_out_state.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/note_cubit/note_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/payment_method_cubit/payment_method_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_companies_cubit/shipping_companies_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/price_container.dart';
import 'package:hanot/general_widgets/custom_button.dart';

import '../../manager/old_addresses_cubit/old_addresses_cubit.dart';
import '../../manager/old_addresses_cubit/old_addresses_state.dart';
import 'coupon_container.dart';
import 'note_container.dart';
import 'options_container.dart';


class CheckOutBody extends StatelessWidget {
  const CheckOutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OldAddressesCubit,OldAddressesState>(builder: (context,state){
      var checkOutCubit = BlocProvider.of<CheckOutCubit>(context);
      var paymentCubit = BlocProvider.of<PaymentMethodCubit>(context);
      var shippingCubit = BlocProvider.of<ShippingCompaniesCubit>(context);
      var noteCubit = BlocProvider.of<NoteCubit>(context);
      var addressCubit = BlocProvider.of<OldAddressesCubit>(context);
      if(state is OldAddressesSuccess){
        return ListView(
          physics: const BouncingScrollPhysics(),
          padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
          children: [
            const OptionsContainer(),
            SizedBox(height: 6.h,),
            const NoteContainer(),
            SizedBox(height: 12.h,),
            const CouponContainer(),
            SizedBox(height: 25.h,),
            const PriceContainer(),
            SizedBox(height: 50.h,),
            BlocBuilder<CheckOutCubit,CheckOutState>(builder: (context,state){
              if(state is CheckOutLoading){
                return SizedBox(width: double.infinity,
                  child: CustomButton(fun: (){}, title:'',titleWidget: loadingIndicator(color: Colors.white,rad: 17),rad: 8),
                );
              }else{
                return SizedBox(width: double.infinity,
                  child: CustomButton(fun: (){
                      checkOutCubit.sendOrder(
                          context: context,
                          paymentMethod: paymentCubit.groupVal!,
                          deliveryMethod:shippingCubit.groupVal==0?'pick_up':'delivery',
                          notes: noteCubit.noteController.text,
                          addressId: addressCubit.groupVal,
                          priceId: shippingCubit.groupVal!
                      );

                  }, title: Texts.sendOrder.tr(),rad: 8),
                );
              }
            }),

          ],
        );
      }else{
        return loadingIndicator();
      }
    });
  }
}
