import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/app_styles.dart';

class MyOrdersNavRow extends StatefulWidget {
  const MyOrdersNavRow({Key? key,}) : super(key: key);

  @override
  State<MyOrdersNavRow> createState() => _MyOrdersNavRowState();
}

class _MyOrdersNavRowState extends State<MyOrdersNavRow> {
  int selected=0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          color: Colors.white
      ),
      padding: const EdgeInsets.all(6),
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      child: Row(
        children: [
          navItem('الجارية', selected==0,(){selected=0;setState(() {});}),
          navItem('السابقة', selected==1,(){selected=1;setState(() {});}),
        ],
      ),
    );
  }

  navItem(String title,bool sel,void Function() fun){
    return Expanded(
      child: GestureDetector(
        onTap: fun,
        child: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.symmetric(vertical: 8.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.r),
              color: sel? Styles.primary:Colors.white
          ),
          child: Styles.text(title,size: 14,color: sel? Colors.white:Colors.black),
        ),
      ),
    );
  }
}
