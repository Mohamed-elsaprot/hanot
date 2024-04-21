import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/general_widgets/custom_button.dart';

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
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.text('ملاحظة على الطلب',size: 11),
              SizedBox(width:200.w,height: 25.h,child: Styles.text('لا يوجد ملاحظات',overflow: TextOverflow.ellipsis)),
            ],
          ),
          const Spacer(),
          CustomButton(fun: (){}, title: 'اضافة ملاحظة',padding: EdgeInsets.symmetric(horizontal: 12.h,vertical: 8.w),rad: 8,)
        ],
      ),
    );
  }
}
