import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_state.dart';

import '../../../../../general_widgets/custom_button.dart';
import '../../manager/shipping_companies_cubit/shipping_companies_cubit.dart';

class ConfirmShippingCompanyButton extends StatelessWidget {
  const ConfirmShippingCompanyButton({Key? key,required this.newIndex}) : super(key: key);
  final num newIndex;
  @override
  Widget build(BuildContext context) {
    var shippingCompanyCubit = BlocProvider.of<ShippingCompaniesCubit>(context);
    var shippingFeesCubit = BlocProvider.of<ShippingFeesCubit>(context);
    return BlocListener<ShippingFeesCubit,ShippingFeesState>(listener: (context,state){
      if(state is ShippingFeesSuccess){
        shippingCompanyCubit.setSelectedCompany(index: newIndex.toInt());
        Navigator.pop(context);
      }
    },child: Container(
      width: double.infinity,
      padding: EdgeInsets.only(left: 15.w,right: 15.w,bottom: 20.h,top: 10.h),
      child: CustomButton(fun: (){
        shippingFeesCubit.getShippingFees(priceId: shippingCompanyCubit.companiesList[newIndex.toInt()].priceId!, context: context);
      }, title: Texts.confirm.tr(),rad: 50,),
    ),);
  }
}
