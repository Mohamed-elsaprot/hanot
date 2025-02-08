import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/app_styles.dart';
import 'package:hanot/core/design/images.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/features/navigation_screen/manager/navigation_screen_manager.dart';
import 'package:hanot/general_widgets/custom_button.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Images.successIcon,width: 120.w,),
            SizedBox(height: 25.h,),
            Styles.text(textsMap['mobile_Your_order_has_been_confirmed_successfully']),
            // SizedBox(height: 15.h,),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Styles.subTitle('تم تأكيد طلبك بنجاح,',size: 13,),
            //     Styles.subTitle('وخصم مبلغ  من محفظتك, ',size: 13,),
            //   ],
            // ),
            // Styles.subTitle('يمكن الان عرض وتحميل الفاتورة.',size: 13),

            // Styles.subTitle('تم تأكيد طلبك بنجاح, وخصم مبلغ  من محفظتك, يمكن الان عرض وتحميل الفاتورة.',size: 13,textAlign: TextAlign.center),
            SizedBox(height: 30.h,),
            SizedBox(width: double.infinity,child: CustomButton(fun: (){
              AppRouter.router.pop();
              AppRouter.router.pop();
              if(AppRouter.router.canPop()){
                AppRouter.router.pop();
              }
              var navCubit = BlocProvider.of<NavigationScreenCubit>(context);
              navCubit.resetNavScreen(x: 3);
            }, title: textsMap['mobile_myOrders'],rad: 50,)),
            SizedBox(height: 10.h,),
            SizedBox(width: double.infinity,child: CustomButton(fun: (){
              AppRouter.router.pop();
              AppRouter.router.pop();
              if(AppRouter.router.canPop()){
                AppRouter.router.pop();
              }
              var navCubit = BlocProvider.of<NavigationScreenCubit>(context);
              navCubit.resetNavScreen(x: 0);
            }, title: textsMap['mobile_Home'],rad: 50,backGroundColor: Colors.grey.shade300,textColor: Colors.black,)),
          ],
        ),
      ),
    );
  }
}
