import 'package:flutter/material.dart';
import 'package:hanot/core/design/app_styles.dart';

class CouponTextField extends StatelessWidget {
  const CouponTextField({Key? key, this.focusNode, required this.onTap, required this.onSubmit, required this.controller,}) : super(key: key);
  // final void Function(String) onChange;
  final TextEditingController controller;
  final void Function() onTap;
  final void Function(String) onSubmit;
  final FocusNode? focusNode;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
        // onChanged: onChange,
      controller: controller,
        onFieldSubmitted: onSubmit,
        focusNode: focusNode,
        onTap: onTap,
        cursorColor: Styles.primary,
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
        borderSide: const BorderSide(width: 0, color: Colors.transparent));
  }
}
