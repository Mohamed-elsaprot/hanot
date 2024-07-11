import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/auth_screen/manager/auth_state.dart';

import '../../../../../core/design/app_styles.dart';

class AuthTextField extends StatelessWidget {
   const AuthTextField({Key? key, this.focusNode, required this.controller,}) : super(key: key);
  final FocusNode? focusNode;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocBuilder<AuthCubit,AuthState>(builder: (context,state) {
      return TextFormField(
        controller: controller,
        focusNode: focusNode,
        onSaved: (x) {if(authCubit.authType=='phone'){authCubit.phone='+972${x!}';}else{authCubit.email=x;}},
        validator: (x){
          if(authCubit.authType=='phone'){
            if(x!.length!=10){
              return '10 num needed';
            }else {
              return null;
            }
          }else{
            if(!x!.contains('@gmail.com')){
              return 'must have @gmail.com';
            }else {
              return null;
            }
          }
        },
        keyboardType:authCubit.authType=='phone'? TextInputType.phone:TextInputType.emailAddress,
        textAlign: TextAlign.end,
        decoration: InputDecoration(
            hintText: authCubit.authType=='phone'?Texts.enterMobileNumberHere.tr():'your@email.com',
            hintStyle: const TextStyle(fontFamily: fontFamily,color: Colors.black38,),
            suffix: authCubit.authType=='phone'? Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(12, 0, 0 ,0),
              child: Styles.subTitle('972+',size: 16),
            ):null,
            border: border(),
            focusedBorder: border(),
            focusColor: Colors.black12,
            enabledBorder: border(),
            filled: true,
            prefixIcon: SizedBox(
              width: 50.w,
              child: const Icon(Icons.check_circle_outline,color: Colors.black26),
            )));
    });
  }
  border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 0, color: Colors.transparent));
  }
}
