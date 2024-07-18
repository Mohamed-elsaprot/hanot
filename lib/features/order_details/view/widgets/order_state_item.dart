import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../consts.dart';
import '../../../../core/design/app_styles.dart';

class OrderStateItem extends StatelessWidget {
  const OrderStateItem({Key? key, required this.title, required this.colored, required this.color})
      : super(key: key);
  final String title,color;
  final bool colored;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100.w,
      child: Column(
        children: [
          colored
              ? Icon(Icons.watch_later_rounded, color: HexColor.fromHex(color), size: 29,)
              : Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      border: Border.all(color: Colors.black26)),
                  padding: const EdgeInsets.all(1),
                  child: const Icon(Icons.circle, color: Colors.black26, size: 25,)),
          SizedBox(height: 4.h,),
          SizedBox(
              width: 90.w,height: 20.h,
              child: FittedBox(
                  alignment: Alignment.center,
                  fit: BoxFit.scaleDown,
                  child: Styles.text(title, color: colored ?  HexColor.fromHex(color) : Colors.black26, size: 13)))
        ],
      ),
    );
  }
}
