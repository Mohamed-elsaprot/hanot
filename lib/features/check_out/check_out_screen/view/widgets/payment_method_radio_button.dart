import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/payment_method_cubit/payment_method_cubit.dart';
import 'package:hanot/features/check_out/check_out_screen/models/payment_method_model/PaymentMethodModel.dart';

import '../../../../../core/design/app_styles.dart';

class PaymentRadioButton extends StatelessWidget {
  const PaymentRadioButton({Key? key,required this.fun, required this.paymentMethodModel}) : super(key: key);
  final void Function(dynamic)? fun;
  final PaymentMethodModel paymentMethodModel;
  @override
  Widget build(BuildContext context) {
    var paymentCubit = BlocProvider.of<PaymentMethodCubit>(context);
    return RadioListTile(
        title: Row(
          children: [
            // Expanded(flex: 2,child: cachedImage(paymentMethodModel.logo??'',boxFit: BoxFit.cover,height: 40)),
            // SizedBox(width: 20.w,),
            Expanded(flex: 10,child: Styles.text(paymentMethodModel.name??'')),
          ],
        ),
        activeColor: Styles.primary,
        value: paymentMethodModel.id!, groupValue: paymentCubit.groupVal, onChanged: fun
    );
  }
}
