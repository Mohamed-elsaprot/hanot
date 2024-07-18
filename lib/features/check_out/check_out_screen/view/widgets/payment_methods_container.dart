import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/payment_method_cubit/paymentMethod_state.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/payment_method_cubit/payment_method_cubit.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/design/images.dart';
import 'custom_continer.dart';
import 'custom_shipping_company_tile.dart';

class PaymentMethodsContainer extends StatefulWidget {
  const                   PaymentMethodsContainer({Key? key}) : super(key: key);

  @override
  State<PaymentMethodsContainer> createState() => _PaymentMethodsContainerState();
}

class _PaymentMethodsContainerState extends State<PaymentMethodsContainer> {

  late PaymentMethodCubit paymentMethodCubit;
  late Map textsMap;
  @override
  void initState() {
    textsMap = BlocProvider.of<LangCubit>(context).texts;
    paymentMethodCubit = BlocProvider.of<PaymentMethodCubit>(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        body:[
          Row(
            children: [
              Image.asset(Images.cardLogo, scale: 4,),
              SizedBox(width: 10.w,),
              Styles.text(textsMap['mobile_paymentMethod'], size: 14)
            ],
          ),
          Divider(endIndent: 5, indent: 5, height: 20.h,),
          BlocBuilder<PaymentMethodCubit,PaymentMethodState>(builder: (context,state){
            if(state is PaymentMethodSuccess){
              var paymentMethodCubit = BlocProvider.of<PaymentMethodCubit>(context);
              return Column(
                children: List.generate(paymentMethodCubit.paymentMethodsList.length, (index) => CustomRadioTiles(
                  title: paymentMethodCubit.paymentMethodsList[index].name,
                  subTitle: paymentMethodCubit.paymentMethodsList[index].logo,
                  image: paymentMethodCubit.paymentMethodsList[index].logo,
                  val: paymentMethodCubit.paymentMethodsList[index].slug, gVal: paymentMethodCubit.groupVal,
                  fun: (x){
                    paymentMethodCubit.groupVal = x!;
                    setState(() {});
                  },
                ),
                ),
              );
            }else{
              return Column(
                children: List.generate(3, (index)=>shimmerWidget(height: 50, width: double.infinity,rad: 8,margin:  EdgeInsets.symmetric(vertical: 6.h)))
              );
            }
          })

        ]
    );
  }
}
