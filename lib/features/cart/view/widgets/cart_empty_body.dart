import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class CartEmptyBody extends StatelessWidget {
  const CartEmptyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 120.h,),
          Image.asset(Images.cart,width: 200.w,),
          SizedBox(height: 20.h,),
          Styles.text(textsMap['mobile_cart_empty'],size: 22),
          SizedBox(height: 10.h,),
          Styles.subTitle(textsMap['mobile_cartEmptyQuote'],size: 13,textAlign: TextAlign.center),
          SizedBox(height: 110.h,),
          Styles.subTitle(textsMap['mobile_availablePaymentMethods'],size: 15,textAlign: TextAlign.center),
          SizedBox(height: 8.h,),
          Align(alignment: Alignment.bottomCenter,child: Image.asset(Images.paymentMethods))
        ],
      ),
    );
  }
}
