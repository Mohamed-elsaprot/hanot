import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/router.dart';
import 'package:hanot/core/design/widgets_fun.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/auth_screen/view/phone/auth_screen.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/features/lang/view/lang.dart';
import 'package:hanot/features/settings/data/settings_repo.dart';
import 'package:hanot/features/settings/manager/settings_cubit.dart';
import 'package:hanot/features/settings/manager/settings_states.dart';
import 'package:hanot/features/settings/view/custom_tile.dart';
import 'package:hanot/features/settings/view/settings_shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../core/design/app_styles.dart';
import '../../../core/design/fun.dart';
import '../../../general_widgets/settings_textScaffold.dart';
import '../../auth_screen/view/name/name.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late Map settings;
  late LangCubit langCubit;
  late SettingsCubit settingsCubit;
  late AuthCubit authCubit;
  // bool? isAuth;
  @override
  void initState() {
    settingsCubit = BlocProvider.of<SettingsCubit>(context);
    langCubit = BlocProvider.of<LangCubit>(context);
    authCubit = BlocProvider.of<AuthCubit>(context);
    settingsCubit.getSettings();
    // isAuth =authCubit.isAuth;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    context.locale;
    return Scaffold(
      body: BlocConsumer<SettingsCubit,SettingsStates>(
          listener: (context,state){
            if(state is SettingsSuccess) settings = settingsCubit.settingsMap;
            if(state is SettingsFailure){
              errorDialog(context: context, message: state.errorMessage);
            }
          },
          builder: (context,state){
        if(state is SettingsSuccess){
          return SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 30.h),
            child: Padding(
              padding: EdgeInsets.only(left: 20.w,right: 20.w),
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
                        SizedBox(
                          height: 50, width: 100.w,
                          child: cachedImage(settings['store_logo'],boxFit: BoxFit.fill),
                        ),
                        SizedBox(width: 15.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Styles.text(settings['store_name'],size: 13),
                            SizedBox(height: 8.h,),
                            SizedBox(
                                width: MediaQuery.of(context).size.width*.55,
                                child: Styles.subTitle(settings['store_description']??'Description',size: 11)),
                          ],
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                    height: 400.h,
                    child: ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(bottom: 30.h),
                      children: [
                        if(settings['about_us']!=null&&settings['about_us']!='')CustomTile(fun: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsTextsScaffold(fromSheet: false,body: settings['about_us'],title: langCubit.texts['mobile_Who_are_we'],)));
                        }, title: langCubit.texts['mobile_Who_are_we'], icon: Icons.error_outline),
                        if(settings['freq_questions']!=null&&settings['freq_questions']!='')CustomTile(fun: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsTextsScaffold(fromSheet: false,body: settings['freq_questions'],title: langCubit.texts['mobile_freq_question_label'],)));
                        }, title: langCubit.texts['mobile_freq_question_label'], icon: CupertinoIcons.text_bubble),
                        if(settings['terms_of_use']!=null&&settings['terms_of_use']!='')CustomTile(fun: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=> SettingsTextsScaffold(fromSheet: false,body: settings['terms_of_use'],title: langCubit.texts['mobile_Terms_of_use'],))), title: langCubit.texts['mobile_Terms_of_use'], icon: CupertinoIcons.text_alignright),
                        CustomTile(fun: (){
                          bottomSheet(context, Name());
                        }, title: langCubit.texts['mobile_store_rating'], icon: CupertinoIcons.star),
                        CustomTile(fun: (){
                          AppRouter.router.push(AppRouter.favScreen);
                        }, title: langCubit.texts['mobile_fav'], icon: CupertinoIcons.heart),
                        CustomTile(fun: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>const Lang()));
                        }, title: langCubit.texts['mobile_store_language'], icon: Icons.language_outlined),
                        if(settings['email']!=null&&settings['email']!='')CustomTile(fun: ()async{
                          final Uri mail = Uri.parse('mailto:${settings['email']}');
                          await canLaunchUrl(mail)? launchUrl(mail):errorDialog(context: context, message: langCubit.texts['mobile_general_error_message']);
                        }, title: langCubit.texts['mobile_Contact_us'], icon: CupertinoIcons.mail),
                        if(settings['whatsapp']!=null&&settings['whatsapp']!='')CustomTile(fun: ()async{
                          final Uri whatsApp = Uri.parse('https://wa.me/${settings['whatsapp']}');
                          await canLaunchUrl(whatsApp)? launchUrl(whatsApp):errorDialog(context: context, message: langCubit.texts['mobile_general_error_message']);
                        }, title: langCubit.texts['mobile_Whats_App'], icon: CupertinoIcons.phone_circle),
                        if (authCubit.isAuth!) ...List.generate(2, (ind)=>CustomTile(fun: ()async{
                          SettingsRepo().logOutDialog(context, () async{
                            await authCubit.logOut();
                            // isAuth = authCubit.isAuth;
                            CartCubit cartCubit = BlocProvider.of<CartCubit>(context);
                            cartCubit.getCartProducts();
                            setState(() {});
                            Navigator.pop(context);
                          });
                        }, title: ind==0? langCubit.texts['mobile_delete_account_label']:
                        langCubit.texts['mobile_Log_out'], icon: Icons.logout,iconColor: Colors.red,textColor: Colors.red.shade400,withDivider:ind==0? true:false,) )
                        else CustomTile(fun: ()async{
                          bottomSheet(context, const AuthScreen());
                        }, title: langCubit.texts['mobile_Log_in'], icon: Icons.login,iconColor: Colors.red,textColor: Colors.red.shade400,withDivider: false,),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }else{
          return const SettingsShimmer();
        }
      }),
    );
  }
}


