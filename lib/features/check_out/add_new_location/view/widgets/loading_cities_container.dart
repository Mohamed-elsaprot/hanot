import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';

import '../../../../../consts.dart';
import '../../../../../core/design/app_styles.dart';

class LoadingCitiesContainer extends StatelessWidget {
  const LoadingCitiesContainer({Key? key, }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 180.w,
      child: DropdownButtonFormField(
        validator: (x){
          if(x==null){
            return Texts.required.tr();
          }else {
            return null;
          }
        },
          decoration: InputDecoration(
            errorStyle: const TextStyle(fontFamily: fontFamily),
              border:  OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
              focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r),borderSide: const BorderSide(color: Styles.primary)),
            label: Styles.subTitle(Texts.city,size: 13).tr(),),
          items: const [],
          onChanged: (x){}),
    );
  }
}
