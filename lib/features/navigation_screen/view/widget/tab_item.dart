import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';

class TabItem extends StatelessWidget {
  const TabItem({Key? key, required this.iconData, required this.title}) : super(key: key);
  final IconData iconData;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Tab(icon: Icon(iconData),child: Styles.text(title,size: 11.w).tr(),);
  }
}
