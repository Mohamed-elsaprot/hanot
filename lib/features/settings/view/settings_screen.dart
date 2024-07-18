import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/images.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/features/lang/view/lang.dart';
import 'package:hanot/features/settings/view/custom_tile.dart';
import 'package:hanot/features/settings/view/dark_mode_tile.dart';

import '../../../core/design/app_styles.dart';
import '../../../core/design/fun.dart';
import '../../../general_widgets/terms_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.locale;
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    return Scaffold(
      appBar: customAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            children: [
              SizedBox(height: 10.h,),
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                ),
                padding: EdgeInsets.symmetric(horizontal: 10.w,vertical: 8.h),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                        backgroundColor: Colors.grey.shade200,
                        child: Image.asset(Images.c,height: 25,),
                    ),
                    SizedBox(width: 15.w,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Styles.text('اسم المتجر',size: 13),
                        SizedBox(height: 8.h,),
                        Styles.subTitle(' وصف صغير عن المتجر يكون هنا',size: 11),
                      ],
                    )
                  ],
                ),
              ),
              // SizedBox(height: 10.h,),
              // const DarkModeTile(),
              SizedBox(height: 10.h,),
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                height: 420.h,
                child: ListView(
                  padding: EdgeInsets.only(bottom: 10.h),
                  physics: const BouncingScrollPhysics(),
                  children: [
                    CustomTile(fun: (){
                      // Navigator.push(context, MaterialPageRoute(builder: (context)=> PaymentWebView()));
                    }, title: textsMap['mobile_Who_are_we'], icon: Icons.error_outline),
                    CustomTile(fun: (){}, title: 'تقيم المتجر', icon: CupertinoIcons.star),
                    CustomTile(fun: (){
                      AppRouter.router.push(AppRouter.favScreen);
                    }, title: textsMap['mobile_fav'], icon: CupertinoIcons.heart),
                    CustomTile(fun: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Lang()));
                    }, title: 'لغة المتجر', icon: Icons.language_outlined),
                    CustomTile(fun: (){}, title: textsMap['mobile_Contact_us'], icon: CupertinoIcons.mail),
                    CustomTile(fun: (){}, title: 'عنوان التوصيل', icon: Icons.location_on_outlined),
                    CustomTile(fun: (){}, title: 'الاسئلة الشائعة', icon: CupertinoIcons.text_bubble),
                    CustomTile(fun: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const TermsWidget(fromSheet: false,))), title: textsMap['mobile_Terms_of_use'], icon: CupertinoIcons.text_alignright),
                    CustomTile(fun: (){}, title: textsMap['mobile_Whats_App'], icon: CupertinoIcons.phone_circle),
                    CustomTile(fun: ()async{}, title: textsMap['mobile_Log_out'], icon: Icons.logout,iconColor: Colors.red,textColor: Colors.red.shade400,),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
