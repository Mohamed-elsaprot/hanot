import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/core/design/images.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../consts.dart';
import '../../general_widgets/custom_button.dart';
import 'app_styles.dart';

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

bottomSheet(BuildContext context,Widget body,{double rad=20,void Function()? fun,bool dismissible=true,}){
  return showModalBottomSheet(
      context: context,
      isDismissible: dismissible,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(rad.r))),
      builder: (_){
        return body;
      }).then((value) async{
    if(fun!=null) fun();
  });
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

AppBar customAppBar(){
  return AppBar(
    elevation: 0,
    title: Row(
      children: [
        Styles.text('Catalog',fontWeight: FontWeight.w900),
        SizedBox(width: 5.w,),
        Image.asset(Images.c,width: 30.w,),
        const Spacer(),
        CircleAvatar(backgroundColor: Styles.primary.withOpacity(.05), child: const Icon(Icons.qr_code,color: Styles.primary,)),
        SizedBox(width: 10.w,),
        CircleAvatar(backgroundColor: Styles.primary.withOpacity(.05),child: const Icon(Icons.shopping_cart_outlined,color: Styles.primary,)),
      ],
    ),
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

