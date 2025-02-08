import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/consts.dart';

abstract class Styles{
  // static const Color primary = Color(0xff3538CD);
  static const Color primary = Colors.black;
  static const Color scaffoldColor = Colors.white;
  static Color secScaffoldColor = Color(0xfff5f5f5);
  // static Color secScaffoldColor = Colors.white.withOpacity(.95);
  static Text text(String t,{int?maxLines,double? size=16,double? letterSpacing,Color? color=Colors.black,FontWeight fontWeight=FontWeight.w600,TextOverflow? overflow,TextAlign? textAlign=TextAlign.start,TextDecoration? textDecoration}){
    return Text(t,
      style: TextStyle(
          letterSpacing: letterSpacing,fontSize: size!.sp,fontWeight: fontWeight,color: color,fontFamily: fontFamily,
          decoration: textDecoration,decorationColor: color),overflow: overflow,textAlign: textAlign,maxLines: maxLines,
    );
  }

  static Text subTitle(String t,{double? size=9,Color color=Colors.black38,FontWeight fontWeight=FontWeight.w600,TextOverflow? overflow,TextAlign? textAlign=TextAlign.start,TextDecoration? textDecoration,int?maxLines,}){
    return Text(t,maxLines: maxLines,style: TextStyle(fontSize: size!.sp,fontWeight: fontWeight,color: color,fontFamily: fontFamily,decoration: textDecoration,decorationColor: color),overflow: overflow,textAlign: textAlign,);
  }
}