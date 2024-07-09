import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/design/appTexts.dart';
import '../../../../../../core/design/fun.dart';

class DropDownPlaceHolder extends StatelessWidget {
  const DropDownPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      validator: (x){
        if(x==null){
          return Texts.required.tr();
        }else {
          return null;
        }
      },
      decoration: dropDownButtonBorderDecoration(),
      menuMaxHeight: 250.h,
      items: [],
      onChanged: (x){},
    );
  }
}
