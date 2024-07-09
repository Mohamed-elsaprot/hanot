import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts.dart';
import '../core/design/app_styles.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key, this.icon=true}) : super(key: key);
  final bool? icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 10.h,horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: 'ابحث عن..',
              hintStyle: const TextStyle(fontWeight: FontWeight.w600,fontFamily: fontFamily,fontSize: 13),
              border: InputBorder.none,
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: const Icon(Icons.search,color: Colors.black45),
              suffixIcon:icon!? const Icon(Icons.qr_code,color: Styles.primary,):null
          ),
        ),
      ),
    );
  }
}
