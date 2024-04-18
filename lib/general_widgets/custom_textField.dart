import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts.dart';
import '../core/design/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.title, required this.controller, this.validator}) : super(key: key);
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      cursorColor: Styles.primary,
      decoration: InputDecoration(
          errorStyle: const TextStyle(fontFamily: fontFamily),
          label: Styles.subTitle(title, size: 13).tr(),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r), borderSide: const BorderSide(color: Styles.primary))),
    );
  }
}
