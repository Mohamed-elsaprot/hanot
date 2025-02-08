import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/auth_screen/manager/auth_state.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../core/design/app_styles.dart';

class AuthTypeContainer extends StatelessWidget {
  const AuthTypeContainer({Key? key, required this.focusNode, required this.controller}) : super(key: key);
  final FocusNode focusNode;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    var textsMap = BlocProvider.of<LangCubit>(context).texts;
    return BlocBuilder<AuthCubit,AuthState>(builder: (context,state){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade100,
        ),
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  controller.text='';
                  focusNode.unfocus();
                  authCubit.email=null;
                  authCubit.changeAuthType('phone');
                },
                child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: authCubit.authType=='email'? Colors.transparent :Colors.white,
                    ),
                    child: Styles.text(textsMap['mobile_Mobile_Number'],color: authCubit.authType=='email'? Colors.black38:Colors.black)),
              ),
            ),
            SizedBox(width: 3.w,),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  // Navigator.pop(context);
                  // bottomSheet(context, const AuthScreen(), rad: 20);
                  controller.text='';
                  focusNode.unfocus();
                  authCubit.phone=null;
                  authCubit.changeAuthType('email');
                },
                child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: authCubit.authType=='phone'? Colors.transparent :Colors.white,
                    ),
                    child: Styles.text(textsMap['mobile_email'],color: authCubit.authType=='phone'? Colors.black38:Colors.black)),
              ),
            ),
          ],
        ),
      );
    });
  }
}
