import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets_fun.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/features/navigation_screen/manager/navigation_screen_manager.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../consts.dart';
import '../../features/cart/manager/cart_cubit/cart_cubit.dart';
import '../../features/cart/manager/cart_cubit/cart_state.dart';
import '../../general_widgets/custom_button.dart';
import 'app_styles.dart';
import 'package:badges/badges.dart' as badges;

errorDialog({required BuildContext context,required String message,})async{
  showDialog(context: context, builder: (context){
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    return AlertDialog(
      shape: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Styles.text(message,textAlign: TextAlign.center),
          SizedBox(height: 20.h,),
          CustomButton(
            padding: EdgeInsets.symmetric(horizontal: 45.w,vertical: 10.h),
            fun: () => Navigator.pop(context),
            title: textsMap['mobile_close'],
            rad: 50,textSize: 12,
          )
        ],
      ),
    );
  });
}

bottomSheet(BuildContext context,Widget body){
  return showCupertinoModalBottomSheet(context: context, builder: (context) => body);
}

loadingDialog(BuildContext context){
  showAdaptiveDialog(context: context, builder: (context){
    return WillPopScope(
        onWillPop: (){
          Navigator.pop(context);
          return Future(() => false);
        },
        child: Center(child: loadingIndicator(),));
  });
}

AppBar customAppBar(BuildContext context, {bool withCartIcon = true, void Function()? fun}){
  var cartCubit = BlocProvider.of<CartCubit>(context);
  var navCubit = BlocProvider.of<NavigationScreenCubit>(context);
  return AppBar(
    elevation: 0,
    toolbarHeight: 35.h,
    title: Row(
      children: [
        Styles.text('B BEAR',size: 24,fontWeight: FontWeight.w900,letterSpacing: 0),
        // SizedBox(width: 5.w,),
        // Image.asset(Images.c,width: 30.w,),
        const Spacer(),
        if(withCartIcon)GestureDetector(
          onTap: fun??(){
            navCubit.setIndex(2);
            navCubit.checkFun(context);
          },
          child: BlocBuilder<CartCubit, CartState>(builder: (context,state)=>cartCubit.cartLen>0?badges.Badge(
              badgeContent: Text(cartCubit.cartLen.toString(), style: const TextStyle(color: Colors.white ,fontSize: 14,),),
              position: badges.BadgePosition.custom(end: 14, bottom: 7,),
              badgeStyle: badges.BadgeStyle(
                padding: EdgeInsets.all(4.4.sp),
                // badgeColor: Styles.primary,
                badgeColor: Colors.red,
              ),
              child: const Icon(Icons.shopping_cart_outlined)):const Icon(Icons.shopping_cart_outlined)),
        ),
        // SizedBox(width: 10.w,),
        // const Icon(Icons.settings,),
      ],
    ),
  );
}

AppBar catAppBar({required BuildContext context,String? title,PreferredSizeWidget? bottom,Widget? action}){
  return AppBar(
    elevation: 0,scrolledUnderElevation: 0,
    title: Styles.text(title??'',),leading: IconButton(onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.arrow_back_ios),),
    bottom: bottom,
    actions: action!=null?[
      action,
      SizedBox(width: 10.w,),
    ]:null,
  );
}

AppBar sheetAppBar({required String title,required BuildContext context}){
  return AppBar(
    elevation: 0,
    toolbarHeight: 50.h,
    leading: const SizedBox(),
    title: Styles.text(title,size: 14),
    actions: [
      GestureDetector(
          onTap: ()=>Navigator.pop(context),
          child: CircleAvatar(backgroundColor: Colors.grey.shade400,radius: 12,child: const Icon(Icons.close,color: Colors.white,size: 18,),)),
      SizedBox(width: 20.w,),
    ],
  );
}

InputDecoration dropDownButtonBorderDecoration(){
  return InputDecoration(
      errorStyle: const TextStyle(fontFamily: fontFamily),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.shade200)),
      focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.shade200)),
      enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.shade200)),
      errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12),borderSide: BorderSide(color: Colors.grey.shade200))
  );
}

