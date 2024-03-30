import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/design/appTexts.dart';
import '../../../../../core/design/app_styles.dart';

class CouponTextField extends StatelessWidget {
  const CouponTextField({Key? key, required this.onChange, this.focusNode, required this.onTap, required this.onSubmit,}) : super(key: key);
  final void Function(String) onChange;
  final void Function() onTap;
  final void Function(String) onSubmit;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        onChanged: onChange,
        onFieldSubmitted: onSubmit,
        focusNode: focusNode,
        onTap: onTap,
        decoration: InputDecoration(
          suffix: const Icon(Icons.article_outlined,color: Colors.black54),
            border: border(),
            focusedBorder: border(),
            focusColor: Colors.black12,
            enabledBorder: border(),
            filled: true,
        ),
    );
  }
  border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(width: 0, color: Colors.transparent));
  }
}
