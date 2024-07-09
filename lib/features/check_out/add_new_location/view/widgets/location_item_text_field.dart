import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/design/app_styles.dart';
import '../../../../../../core/design/images.dart';
import '../../../../../../general_widgets/custom_textField.dart';

class LocationItemTextField extends StatefulWidget {
  const LocationItemTextField({Key? key, required this.title, required this.required, required this.iconData, required this.controller, this.validator,}) : super(key: key);
  final String title;
  final bool required;
  final IconData iconData;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  @override
  State<LocationItemTextField> createState() => _LocationItemTextFieldState();
}

class _LocationItemTextFieldState extends State<LocationItemTextField> {
  bool empty=true;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Styles.text(widget.title,size: 12),
                if(widget.required)Padding(
                  padding: const EdgeInsets.only(bottom: 4),
                  child: Image.asset(Images.requiredStar,width: 10,),
                )
              ],
            ),
            SizedBox(height: 4.h,),
            CustomTextField(
              validator: widget.validator,
              hint: widget.title,
              inputBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.shade200)),
              fillColor: Colors.transparent,
              controller: widget.controller,
              onChange: (x){
                empty= x.isEmpty? true:false;
                setState(() {});
              },
              icon: Icon(widget.iconData,color: empty?Colors.grey.shade400:Styles.primary,size: 20,),
            )
          ]
      ),
    );
  }
}
