import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class CartEmptyBody extends StatelessWidget {
  const CartEmptyBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          SizedBox(height: 120.h,),
          Image.asset(Images.cart,width: 200.w,),
          SizedBox(height: 20.h,),
          Styles.text(Texts.cartEmpty.tr(),size: 22),
          SizedBox(height: 10.h,),
          Styles.subTitle(Texts.cartEmptyQuote.tr(),size: 13,textAlign: TextAlign.center),
          SizedBox(height: 110.h,),
          Styles.subTitle(Texts.availablePaymentMethods.tr(),size: 15,textAlign: TextAlign.center),
          SizedBox(height: 8.h,),
          Align(alignment: Alignment.bottomCenter,child: Image.asset(Images.paymentMethods))
        ],
      ),
    );
  }
}
