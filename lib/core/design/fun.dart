import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets.dart';

import '../../general_widgets/custom_button.dart';
import 'app_styles.dart';

errorDialog({required BuildContext context,required String message,})async{
  showDialog(context: context, builder: (context){
    return AlertDialog(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Styles.text(message,textAlign: TextAlign.center),
          SizedBox(height: 14.h,),
          CustomButton(
            padding: EdgeInsets.symmetric(horizontal: 50.w,vertical: 10.h),
            fun: () => Navigator.pop(context),
            title: 'اغلاق',
          )
        ],
      ),
    );
  });
}

bottomSheet(BuildContext context,Widget body,{required double rad,void Function()? fun,bool dismissible=true,}){
  return showModalBottomSheet(
      context: context,
      isDismissible: dismissible,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(rad.r))),
      builder: (context){
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