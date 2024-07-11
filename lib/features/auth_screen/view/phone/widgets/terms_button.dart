import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/general_widgets/terms_widget.dart';

import '../../../../../core/design/app_styles.dart';

class TermsButton extends StatelessWidget {
  const TermsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Styles.text('By continuing you agree to'.tr(),size: 11),
        GestureDetector(
            onTap: (){
              bottomSheet(context, SizedBox(height: 500.h,child: const TermsWidget(fromSheet: true,)));
            },
            child: Styles.text("terms and Conditions".tr(),color: const Color(0xffFF9500),size: 11)),
        const SizedBox(width: 2,),
        Styles.text("store specific".tr(),size: 11),
      ],
    );
  }
}
