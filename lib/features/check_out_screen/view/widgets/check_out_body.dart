import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/check_out_screen/view/widgets/coupon_container.dart';
import 'package:hanot/features/check_out_screen/view/widgets/note_container.dart';
import 'package:hanot/features/check_out_screen/view/widgets/options_container.dart';
import 'package:hanot/features/check_out_screen/view/widgets/price_container.dart';
import 'package:hanot/general_widgets/custom_button.dart';


class CheckOutBody extends StatelessWidget {
  const CheckOutBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: EdgeInsets.symmetric(horizontal: 15.w,vertical: 10.h),
      children: [
        OptionsContainer(),
        SizedBox(height: 6.h,),
        NoteContainer(),
        SizedBox(height: 12.h,),
        CouponContainer(),
        SizedBox(height: 25.h,),
        PriceContainer(),
        SizedBox(height: 50.h,),
        SizedBox(width: double.infinity,
          child: CustomButton(fun: (){}, title: 'ارسال الطلب',rad: 8),
        )
      ],
    );
  }
}
