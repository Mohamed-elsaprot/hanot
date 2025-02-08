import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/core/design/widgets_fun.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/auth_screen/manager/auth_state.dart';
import 'package:hanot/features/auth_screen/view/otp/widgets/otp_text_field.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/general_widgets/custom_button.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';
import '../name/name.dart';
import '../phone/widgets/auth_sheet_close_button.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key}) : super(key: key);
  final FocusNode focusNode = FocusNode();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var textsMap = BlocProvider.of<LangCubit>(context).texts;
    focusNode.requestFocus();
    return Stack(
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
                        Styles.text(textsMap['mobile_Password'],),
                      ],
                    ),
                    SizedBox(height: 50.h,),
                    ClipRRect(borderRadius: BorderRadius.circular(40.r), child: Image.asset(Images.otp,height: 110.h,),),
                    SizedBox(height: 15.h,),
                    Styles.text(textsMap['mobile_To_Continue_Login_process'],size: 22),
                    SizedBox(height: 15.h,),
                    Styles.subTitle(textsMap['mobile_Please_Enter_The_Otp'],size: 16,color: Colors.black54),
                    SizedBox(height: 50.h,),
                    Form(key: formKey,child: OtpTextField(focusNode: focusNode)),
                    SizedBox(height: 30.h,),
                    BlocConsumer<AuthCubit,AuthState>(
                        builder: (context,state){
                          if(state is AuthLoading){
                            return SizedBox(width: double.infinity,child: CustomButton(rad: 20,fun: (){}, title: '',titleWidget: loadingIndicator(color: Colors.white,rad: 25),));
                          }else{
                            return SizedBox(
                                width: double.infinity,
                                child: CustomButton(
                                  fun: (){
                                    if(formKey.currentState!.validate()){
                                      focusNode.unfocus();
                                      formKey.currentState!.save();
                                    }
                                  }, title: textsMap['mobile_Confirm'],textSize: 20,rad: 20,));
                          }
                    },
                      listener: (context,state){
                          if(state is AuthFailure) errorDialog(context: context, message: state.errorMessage);
                          if(state is AuthSuccess){
                            if(state.name==null){
                              Navigator.pop(context);
                              Future.delayed(const Duration(milliseconds: 200),()=>bottomSheet(context, Name()));
                            }else{
                              Navigator.pop(context);
                            }
                          }
                      },
                    ),

                  ],
                ),
              ),
            ),
          ),
        ),
        const PositionedDirectional(
            end: 20,top: 20,
            child: SheetCloseButton()),
      ],
    );
  }
}
