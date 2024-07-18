import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../general_widgets/custom_button.dart';
import '../../manager/coupon_cubit/coupon_cubit.dart';
import '../../manager/coupon_cubit/coupon_state.dart';

class ActivateCouponButton extends StatelessWidget {
  const ActivateCouponButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    var couponCubit = BlocProvider.of<CouponCubit>(context);
    return BlocBuilder<CouponCubit,CouponState>(builder: (context,state){
      if(state is CouponSuccess){
        return CustomButton(fun: (){
          couponCubit.applyCouponAndUpdateCartTotal(context: context);
        }, title:'',titleWidget: Row(
          children: [
            const Icon(Icons.check_circle,color: Colors.white,size: 18,),
            const SizedBox(width: 10,),
            Styles.text(textsMap['mobile_activated'],color: Colors.white,size: 12),
          ],
        ),padding: const EdgeInsets.symmetric(horizontal: 10),rad: 6,textSize: 12,backGroundColor: Colors.green,);
      }else if( state is CouponLoading){
        return CustomButton(fun: (){}, title:'',titleWidget: loadingIndicator(color: Colors.white,rad: 20),padding: EdgeInsets.zero,rad: 6,textSize: 12,);
      }else{
        return CustomButton(fun: (){
          couponCubit.applyCouponAndUpdateCartTotal(context: context);
        }, title: textsMap['mobile_activation'],padding: EdgeInsets.zero,rad: 6,textSize: 12,);
      }
    },);
  }
}
