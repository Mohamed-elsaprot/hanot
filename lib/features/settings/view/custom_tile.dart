import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';

import '../../../core/design/app_styles.dart';

class CustomTile extends StatelessWidget {
  const CustomTile({Key? key, required this.fun, required this.title, required this.icon, this.iconColor, this.textColor}) : super(key: key);
  final void Function() fun;
  final String title;
  final IconData icon;
  final Color? iconColor,textColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: fun,
          borderRadius:  BorderRadius.circular(10),
          child: Container(
            height: 40.h,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Row(
              children: [
                Icon(icon,size: 20,color: iconColor?? Colors.grey.shade500,),
                SizedBox(width: 10.w,),
                Styles.text(title,size: 12.5,color: textColor),
              ],
            ),
          ),
        ),
        Divider(indent: 20.w, endIndent: 20.w,height: 0),
      ],
    );
  }
}
