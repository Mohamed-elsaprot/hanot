import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../general_widgets/custom_textField.dart';

class SearchAppBar extends StatelessWidget {
  const SearchAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
      child: CustomTextField(
        controller: TextEditingController(),
        icon: const Icon(Icons.search,),
        height: 35.h,hint: 'ابحث عن...',
      ),
    );
  }
}
