import'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/auth_screen/manager/auth_state.dart';

import '../../../../../core/design/app_styles.dart';
// import '../../../../../core/design/fun.dart';
// import '../phone_auth_screen.dart';

class AuthTypeContainer extends StatelessWidget {
  const AuthTypeContainer({Key? key, required this.focusNode}) : super(key: key);
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit,AuthState>(builder: (context,state){
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.grey.shade300,
        ),
        padding: const EdgeInsets.all(2),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  // Navigator.pop(context);
                  // bottomSheet(context, const AuthScreen(), rad: 20);
                  focusNode.unfocus();
                  authCubit.changeAuthType('phone');
                },
                child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: authCubit.authType=='email'? Colors.transparent :Colors.white,
                    ),
                    child: Styles.text(Texts.mobileNumber,color: authCubit.authType=='email'? Colors.black38:Colors.black).tr()),
              ),
            ),
            SizedBox(width: 3.w,),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: (){
                  // Navigator.pop(context);
                  // bottomSheet(context, const AuthScreen(), rad: 20);
                  focusNode.unfocus();
                  authCubit.changeAuthType('email');
                },
                child: Container(
                    height: 55,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: authCubit.authType=='phone'? Colors.transparent :Colors.white,
                    ),
                    child: Styles.text(Texts.email,color: authCubit.authType=='phone'? Colors.black38:Colors.black).tr()),
              ),
            ),
          ],
        ),
      );
    });
  }
}
