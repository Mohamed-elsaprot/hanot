import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/widgets.dart';

import '../../../../../core/design/appTexts.dart';
import '../../../../../general_widgets/custom_button.dart';
import '../../manager/coupon_cubit/coupon_cubit.dart';
import '../../manager/coupon_cubit/coupon_state.dart';

class ActivateCouponButton extends StatelessWidget {
  const ActivateCouponButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var couponCubit = BlocProvider.of<CouponCubit>(context);
    return BlocBuilder<CouponCubit,CouponState>(builder: (context,state){
      if(state is CouponSuccess){
        return CustomButton(fun: (){
          couponCubit.applyCouponAndUpdateCartTotal(context: context);
        }, title:'',titleWidget: Row(
          children: [
            const Icon(Icons.check_circle,color: Colors.white,size: 18,),
            const SizedBox(width: 10,),
            Styles.text(Texts.activated.tr(),color: Colors.white,size: 12),
          ],
        ),padding: const EdgeInsets.symmetric(horizontal: 10),rad: 6,textSize: 12,backGroundColor: Colors.green,);
      }else if( state is CouponLoading){
        return CustomButton(fun: (){}, title:'',titleWidget: loadingIndicator(color: Colors.white,rad: 20),padding: EdgeInsets.zero,rad: 6,textSize: 12,);
      }else{
        return CustomButton(fun: (){
          couponCubit.applyCouponAndUpdateCartTotal(context: context);
        }, title: Texts.activation.tr(),padding: EdgeInsets.zero,rad: 6,textSize: 12,);
      }
    },);
  }
}
