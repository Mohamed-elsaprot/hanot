import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/core/design/images.dart';
import 'package:hanot/general_widgets/custom_textField.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/fun.dart';
import '../../../../core/design/widgets_fun.dart';
import '../../../../general_widgets/custom_button.dart';
import '../../../lang/manager/lang_cubit.dart';
import '../../manager/auth_cubit.dart';
import '../../manager/auth_state.dart';
import '../phone/widgets/auth_sheet_close_button.dart';

class Name extends StatelessWidget {
  Name({Key? key}) : super(key: key);
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var textsMap = BlocProvider.of<LangCubit>(context).texts;
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return Stack(
      children: [
        Scaffold(
          body: Padding(
            padding: EdgeInsets.all(25.sp),
            child: SingleChildScrollView(
              physics:const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 150.h,),
                  Image.asset(Images.man,height: 120.h,),
                  SizedBox(height: 50.h,),
                  Styles.text(textsMap['mobile_please_enter_name_validation_label'],size: 22),
                  SizedBox(height: 15.h,),
                  Form(key: formKey,
                      child: CustomTextField(
                        controller: controller,textAlign: TextAlign.center,validator: (x){
                          if(x!.isEmpty){
                            return textsMap['mobile_required'];
                          }else {
                            return null;
                          }
                      },
                        textStyle: TextStyle(fontWeight: FontWeight.w600,fontSize: 25.sp,fontFamily: fontFamily),
                      ),
                  ),
                  SizedBox(height: 20.h,),
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
                                  authCubit.setName(name: controller.text);
                                }
                              }, title: textsMap['mobile_Confirm'],textSize: 20,rad: 20,));
                      }
                    },
                    listener: (context,state){
                      if(state is AuthFailure) errorDialog(context: context, message: state.errorMessage);
                      if(state is AuthSuccess) Navigator.pop(context);
                    },
                  ),

                ],
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
