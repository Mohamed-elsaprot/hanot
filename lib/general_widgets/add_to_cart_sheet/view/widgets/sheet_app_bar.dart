import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/design/images.dart';
import 'package:badges/badges.dart' as badges;

class SheetAppBar extends StatelessWidget {
  const SheetAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 35.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: ()=>Navigator.pop(context),
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.arrow_back,color: Colors.black,),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: Stack(
              children: [
                SizedBox(
                    height: double.infinity,
                    child: Image.asset(
                      Images.shoppingBag,
                      width: 25.w,
                    )),
                badges.Badge(
                  badgeContent: const Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                  position: badges.BadgePosition.custom(end: 0, bottom: 1),
                  badgeStyle: badges.BadgeStyle(
                    padding: EdgeInsets.all(3.sp),
                    badgeColor: Colors.red,
                  ),
                  child: SizedBox(
                    width: 25.w,
                    height: 50.h,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
