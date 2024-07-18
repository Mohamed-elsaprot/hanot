import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/auth_screen/view/phone/widgets/auth_button.dart';
import 'package:hanot/features/auth_screen/view/phone/widgets/auth_type_container.dart';
import 'package:hanot/features/auth_screen/view/phone/widgets/auth_sheet_close_button.dart';
import 'package:hanot/features/auth_screen/view/phone/widgets/phone_text_field.dart';
import 'package:hanot/features/auth_screen/view/phone/widgets/terms_button.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';
import '../../../lang/manager/lang_cubit.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  late AuthCubit authCubit;
  late Map textsMap;
  late TextEditingController controller;
  @override
  void initState() {
    authCubit = BlocProvider.of<AuthCubit>(context);
    textsMap = BlocProvider.of<LangCubit>(context).texts;
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
                          Styles.text(textsMap['mobile_Log_in'],),
                        ],
                      ),
                      SizedBox(height: 50.h,),
                      ClipRRect(borderRadius: BorderRadius.circular(40.r), child: Image.asset(Images.logIn,height: 110.h,),),
                      SizedBox(height: 15.h,),
                      Styles.text(textsMap['mobile_Hello_our_dear_visitor'],size: 24),
                      SizedBox(height: 15.h,),
                      Styles.subTitle(textsMap['mobile_Please_log_in_to_complete_your_shopping'],size: 16,color: Colors.black54),
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
                          } ,title: textsMap['mobile_Log_in'],rad: 12,textSize: 20,)),
                      SizedBox(height: 15.h,),
                      const TermsButton()
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
      ),
    );
  }
}
