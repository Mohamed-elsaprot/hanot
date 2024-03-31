import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class ShoppingQuotRow extends StatelessWidget {
  const ShoppingQuotRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.yellow.withOpacity(.2)
      ),
      padding: EdgeInsets.symmetric(horizontal: 12.w,vertical: 8.h),
      child: Row(
        children: [
          Image.asset(Images.twoBags,width: 30.w,),
          SizedBox(width: 10.w,),
          Styles.text('za casdss sdgwere dsfyu 50 PLN serd',color: Colors.black45)
        ],
      ),
    );
  }
}
