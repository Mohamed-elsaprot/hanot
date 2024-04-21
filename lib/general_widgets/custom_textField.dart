import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts.dart';
import '../core/design/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, required this.title, required this.controller, this.validator, this.maxLines=1, this.onChange, this.onTap, this.onSubmit, this.focusNode}) : super(key: key);
  final String title;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final void Function(String)? onSubmit;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onChanged: onChange,
      onFieldSubmitted: onSubmit,
      controller: controller,
      validator: validator,
      cursorColor: Styles.primary,
      maxLines: maxLines,
      decoration: InputDecoration(
          errorStyle: const TextStyle(fontFamily: fontFamily),
          label: Styles.subTitle(title, size: 13),
          alignLabelWithHint: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r)),
          focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(15.r), borderSide: const BorderSide(color: Styles.primary))),
    );
  }
}
