import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class FavEmpty extends StatelessWidget {
  const FavEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.favEmpty,height: 100.h,),
          SizedBox(height: 10.h,),
          Styles.text(Texts.youDidNotAddAnyProduct.tr()),
          SizedBox(height: 10.h,),
          Styles.subTitle(Texts.favEmptyQuote.tr(),size: 13)
        ],
      ),
    );
  }
}
