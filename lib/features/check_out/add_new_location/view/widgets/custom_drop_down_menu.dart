import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/core/design/appTexts.dart';

import '../../../../../core/design/app_styles.dart';

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({Key? key, required this.title, required this.valList, this.controller, required this.onSelect,}) : super(key: key);
  final String title;
  final List valList;
  final void Function(dynamic)? onSelect;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    // TextEditingController controller2= TextEditingController();
    return DropdownButtonFormField(
      // value: valList[0],
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
          label: Styles.subTitle(title, size: 13).tr(),),
        items: List.generate(valList.length, (index) =>
            DropdownMenuItem(
                value: valList[index],
                child: Text(valList[index].label, style: const TextStyle(fontFamily: fontFamily, fontSize: 15, fontWeight: FontWeight.w900),),
          ),
        ),
        onChanged: onSelect);
  }
}