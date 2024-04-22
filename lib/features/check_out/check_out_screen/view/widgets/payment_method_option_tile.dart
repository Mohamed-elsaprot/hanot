import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/payment_method_cubit/paymentMethod_state.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/payment_method_cubit/payment_method_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/view/widgets/payment_method_radio_button.dart';

import '../../../../../core/design/app_styles.dart';

class PaymentOptionTile extends StatefulWidget {
  const PaymentOptionTile({Key? key}) : super(key: key);

  @override
  State<PaymentOptionTile> createState() => _PaymentOptionTileState();
}

class _PaymentOptionTileState extends State<PaymentOptionTile> {
  late PaymentMethodCubit paymentMethodCubit;
  @override
  void initState() {
    paymentMethodCubit = BlocProvider.of<PaymentMethodCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentMethodCubit,PaymentMethodState>(builder: (context, state) {
      return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.grey.shade200,
          ),
          margin: EdgeInsets.symmetric(vertical: 6.h),
          child: ExpansionTile(
            leading: Icon(Icons.money, size: 30.w,),
            backgroundColor: Colors.white,
            iconColor: Styles.primary,
            textColor: Styles.primary,
            title: BlocBuilder<PaymentMethodCubit,PaymentMethodState>(builder: (context,state){
              if(state is PaymentMethodSuccess){
                return Styles.text('${Texts.payBy.tr()}: ${paymentMethodCubit.selectedPaymentMethod?.name??''}');
              }else{
                return Row(
                  children: [
                    Styles.text('${Texts.payBy.tr()}:  ', fontWeight: FontWeight.w900),
                    shimmerWidget(height: 12, width: 60,rad: 6),
                  ],
                );
              }
            }),
            children: List.generate(paymentMethodCubit.paymentMethodsList.length, (index) => PaymentRadioButton(
                fun: (x){
                  paymentMethodCubit.groupVal = x;
                  paymentMethodCubit.setSelectedPaymentMethod(index);
                  setState(() {});
                },
                paymentMethodModel: paymentMethodCubit.paymentMethodsList[index])),
          ));
    });
  }
}
