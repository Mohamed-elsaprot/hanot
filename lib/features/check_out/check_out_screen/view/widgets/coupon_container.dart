import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../core/design/app_styles.dart';
import 'coupon_text_field.dart';
import 'custom_continer.dart';

class CouponContainer extends StatelessWidget {
  const CouponContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    return CustomContainer(
        body: [
          Styles.text(textsMap['mobile_discountCoupon']),
          SizedBox(height: 8.h,),
          const CouponTextField()
        ]
    );
  }
}
