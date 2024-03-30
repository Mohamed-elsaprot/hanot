import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/features/cart/view/widgets/coupon_text_field.dart';
import 'package:hanot/general_widgets/custom_button.dart';

import '../../../../core/design/app_styles.dart';

class CodeSheetBody extends StatefulWidget {
  const CodeSheetBody({Key? key}) : super(key: key);

  @override
  State<CodeSheetBody> createState() => _CodeSheetBodyState();
}

class _CodeSheetBodyState extends State<CodeSheetBody> {
  double height = 180;
  FocusNode focusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 15.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.text(Texts.enterTheCoupon).tr(),
          SizedBox(height: 10.h,),
          CouponTextField(
              focusNode: focusNode,
              onSubmit: (x){
                height = 180;setState(() {});
              },
              onChange: (x){},
              onTap: (){
            height=380;setState(() {});
          }),
          SizedBox(height: 15.h,),
          SizedBox(width: double.infinity,
            child: CustomButton(fun: (){}, title: Texts.disCount.tr(),rad: 12,),
          )
        ],
      ),
    );
  }
}
