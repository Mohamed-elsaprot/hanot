import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../core/design/images.dart';
import 'package:badges/badges.dart' as badges;

import '../features/tabs_screen/view/widgets/tab_bar.dart';

PreferredSizeWidget appBar(TabController controller){
  return AppBar(
    centerTitle: true,
    leading: Icon(
      CupertinoIcons.search,
      size: 25.sp,
    ),
    title: Image.asset(Images.sinsay,width: 100.w,),
    actions: [
      Image.asset(Images.barcode, width: 30.w,),
      SizedBox(width: 15.w,),
      Stack(
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
              padding: EdgeInsets.all(5.sp),
              badgeColor: Colors.red,
            ),
            child: SizedBox(
              width: 30.w,
              height: 42.h,
            ),
          )
        ],
      ),
      SizedBox(
        width: 15.w,
      ),
    ],
    bottom: PreferredSize(
      preferredSize: Size.fromHeight(35.h),
      child:  CustomTabBar(controller: controller),
    ),
  );
}