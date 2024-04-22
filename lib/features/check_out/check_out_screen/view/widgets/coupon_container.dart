import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/coupon_cubit/coupon_cubit.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/design/fun.dart';
import '../../../../../general_widgets/custom_button.dart';
import 'code_sheet_body.dart';

class CouponContainer extends StatelessWidget {
  const CouponContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var couponCubit = BlocProvider.of<CouponCubit>(context);
    return Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.r), color: Colors.grey.shade200),
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.text('هل لديك كوبون؟',),
              Styles.text(couponCubit.couponCode,),
            ],
          ),
          const Spacer(),
          CustomButton(
            fun: () {
              bottomSheet(context, BlocProvider.value(value: BlocProvider.of<CouponCubit>(context), child: const CouponSheetBody(),)
              );
            },
            title: 'اضافة كوبون',
            rad: 6,
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 6.h),
          )
        ],
      ),
    );
  }
}
