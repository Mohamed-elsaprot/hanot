import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';

class OrderStateItem extends StatelessWidget {
  const OrderStateItem({Key? key, required this.title, required this.colored}) : super(key: key);
  final String title;
  final bool colored;
  @override
  Widget build(BuildContext context) {
    return Expanded(child: Column(
      children: [
        colored? const Icon(Icons.watch_later_rounded,color: Colors.blue,size: 30,):
        Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(color: Colors.black26)
            ),
            padding: const EdgeInsets.all(1),
            child: const Icon(Icons.circle,color: Colors.black26,size: 25,)),
        SizedBox(height: 4.h,),
        Styles.text(title,color:colored? Colors.blue:Colors.black26,size: 13)
      ],
    ));
  }
}
