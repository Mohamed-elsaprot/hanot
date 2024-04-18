import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/design/app_styles.dart';


class NoteContainer extends StatelessWidget {
  const NoteContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey.shade200
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Styles.text('ملاحظة على الطلب',size: 11),
          Styles.text('ملاحظة على الطلب'),
        ],
      ),
    );
  }
}
