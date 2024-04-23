import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/widgets.dart';
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
      var cubit = BlocProvider.of<OldAddressesCubit>(context);
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
            SizedBox(width: double.infinity,
              child: CustomButton(fun: (){
                errorDialog(context: context, message: '${cubit.groupVal} ${cubit.selectedAddress?.city} ${cubit.selectedAddress?.neighborhood}');
              }, title: Texts.sendOrder.tr(),rad: 8),
            )
          ],
        );
      }else{
        return loadingIndicator();
      }
    });
  }
}
