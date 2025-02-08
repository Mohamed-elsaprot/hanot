import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../consts.dart';
import '../core/design/app_styles.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({Key? key, this.title, required this.controller, this.validator, this.maxLines=1, this.onChange, this.onTap, this.onSubmit, this.focusNode, this.icon, this.fillColor, this.inputBorder, this.hint, this.height, this.textInputType, this.textAlign, this.textStyle}) : super(key: key);
  final String? title,hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  final int? maxLines;
  final void Function(String)? onChange;
  final void Function()? onTap;
  final void Function(String)? onSubmit;
  final FocusNode? focusNode;
  final Icon? icon;
  final Color? fillColor;
  final InputBorder? inputBorder;
  final double? height;
  final TextInputType? textInputType;
  final TextAlign? textAlign;
  final TextStyle? textStyle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h,
      child: TextFormField(
        keyboardType: textInputType,
        onTap: onTap,
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        controller: controller,
        validator: validator,
        cursorColor: Styles.primary,
        maxLines: maxLines,
        textAlign: textAlign??TextAlign.start,
        style: textStyle,
        decoration: InputDecoration(
            prefixIcon: icon,
            hintText: hint,
            prefixIconColor: Colors.grey.shade400,
            hintStyle: const TextStyle(fontFamily: fontFamily,fontSize: 12),
            iconColor: Styles.primary,
            fillColor: fillColor??Colors.grey.shade100,
            filled: true,
            errorStyle: const TextStyle(fontFamily: fontFamily),
            label: title!=null? Styles.subTitle(title!, size: 13):null,
            alignLabelWithHint: true,
            errorBorder: inputBorder??border(),
            border: inputBorder??border(),
            focusedBorder: inputBorder??border(),
            enabledBorder: inputBorder??border(),
        )
      ),
    );
  }
  border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 0, color: Colors.transparent)
    );
  }
}
