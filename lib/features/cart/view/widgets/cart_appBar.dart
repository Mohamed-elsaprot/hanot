import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class CartAppBar extends StatelessWidget {
  const CartAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Styles.text('Catalog',fontWeight: FontWeight.w900),
        SizedBox(width: 5.w,),
        Image.asset(Images.c,width: 30.w,),
        const Spacer(),
        CircleAvatar(backgroundColor: Styles.primary.withOpacity(.05), child: const Icon(Icons.notifications_none_rounded,color: Styles.primary,)),
        // SizedBox(width: 10.w,),
        // CircleAvatar(backgroundColor: Styles.primary.withOpacity(.05),child: const Icon(CupertinoIcons.delete_simple,color: Styles.primary,)),
      ],
    );
  }
}
