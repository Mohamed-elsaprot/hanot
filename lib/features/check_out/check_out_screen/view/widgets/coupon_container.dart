import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';

import '../../../../../core/design/app_styles.dart';
import 'coupon_text_field.dart';
import 'custom_continer.dart';

class CouponContainer extends StatelessWidget {
  const CouponContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
        body: [
          Styles.text(Texts.discountCoupon.tr()),
          SizedBox(height: 8.h,),
          CouponTextField()
        ]
    );
  }
}
