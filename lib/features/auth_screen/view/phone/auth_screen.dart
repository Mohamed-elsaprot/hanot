import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/auth_screen/view/phone/widgets/auth_button.dart';
import 'package:hanot/features/auth_screen/view/phone/widgets/auth_type_container.dart';
import 'package:hanot/features/auth_screen/view/phone/widgets/auth_sheet_close_button.dart';
import 'package:hanot/features/auth_screen/view/phone/widgets/phone_text_field.dart';
import 'package:hanot/features/auth_screen/view/phone/widgets/terms_button.dart';

import '../../../../core/design/appTexts.dart';
import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthCubit authCubit;
  late TextEditingController controller;
  @override
  void initState() {
    authCubit = BlocProvider.of<AuthCubit>(context);
    controller = TextEditingController();
    super.initState();
  }
  final _focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    _focusNode.requestFocus();
    return SizedBox(
      height: 660.h,
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Scaffold(
              body: Padding(
                padding: EdgeInsets.all(25.sp),
                child: SingleChildScrollView(
                  physics:const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Styles.text(Texts.logIn,).tr(),
                        ],
                      ),
                      SizedBox(height: 50.h,),
                      ClipRRect(borderRadius: BorderRadius.circular(40.r), child: Image.asset(Images.logIn,height: 110.h,),),
                      SizedBox(height: 15.h,),
                      Styles.text(Texts.helloOurDearVisitor,size: 24).tr(),
                      SizedBox(height: 15.h,),
                      Styles.subTitle(Texts.pleaseLogInToCompleteYourShopping,size: 16,color: Colors.black54).tr(),
                      SizedBox(height: 20.h,),
                      AuthTypeContainer(controller: controller,focusNode: _focusNode),
                      SizedBox(height: 35.h,),
                      Form(
                        key: formKey,
                        child: AuthTextField(controller: controller,focusNode: _focusNode),
                      ),
                      SizedBox(height: 20.h,),
                      SizedBox(
                          width: double.infinity,
                          child: AuthButton(
                            fun: ()async{
                            if(formKey.currentState!.validate()){
                              _focusNode.unfocus();
                              formKey.currentState!.save();
                              await authCubit.sendOtp(context: context);
                            }
                          } ,title: Texts.logIn.tr(),rad: 12,textSize: 20,)),
                      SizedBox(height: 15.h,),
                      const TermsButton()
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: EdgeInsetsDirectional.only(top: 20.sp,end: 15.sp),
              child: const SheetCloseButton()
          ),
        ],
      ),
    );
  }
}
