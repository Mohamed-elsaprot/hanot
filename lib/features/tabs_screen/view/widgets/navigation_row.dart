import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';

import '../../../../core/design/app_styles.dart';

class NavigationRow extends StatelessWidget {
  const NavigationRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Styles.text(Texts.search).tr(),
          const Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16,
          )
        ],
      ),
    );
  }
}
