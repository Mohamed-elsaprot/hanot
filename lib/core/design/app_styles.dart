import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/consts.dart';

abstract class Styles{
  static const Color primary = Color(0xff072c5d);
  static Text text(String t,{double? size=16,Color color=Colors.black,FontWeight fontWeight=FontWeight.w600,TextOverflow? overflow,TextAlign? textAlign=TextAlign.start}){
    return Text(t,style: TextStyle(fontSize: size!.sp,fontWeight: fontWeight,color: color,fontFamily: fontFamily),overflow: overflow,textAlign: textAlign,);
  }

  static Text subTitle(String t,{double? size=9,Color color=Colors.black26,FontWeight fontWeight=FontWeight.w600,TextOverflow? overflow}){
    return Text(t,style: TextStyle(fontSize: size!.sp,fontWeight: fontWeight,color: color,fontFamily: fontFamily),overflow: overflow,);
  }
}