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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.cart,height: 250,width: 250.w,),
          Styles.subTitle(Texts.cartEmpty,size: 25,color: Colors.black54).tr()
        ],
      ),
    );
  }
}
