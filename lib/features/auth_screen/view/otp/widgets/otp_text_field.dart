import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/core/design/appTexts.dart';

import '../../../manager/auth_cubit.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({Key? key, required this.focusNode,}) : super(key: key);
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return TextFormField(
      validator: (x){
        if(x==null || x.isEmpty || x.length!=4){
          return Texts.pleaseEnter4Num.tr();
        }else {
          return null;
        }
      },
      onSaved: (x)=>authCubit.confirmOtp(context: context,code: x!),
      focusNode: focusNode,
      textAlign: TextAlign.center,
      maxLength: 4,
      style: const TextStyle(letterSpacing: 10,fontWeight: FontWeight.w900,fontSize: 25),
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        errorStyle: const TextStyle(fontFamily: fontFamily),
        border: border(),
        focusedBorder: border(),
        focusColor: Colors.black12,
        enabledBorder: border(),
        filled: true,
      ),
    );
  }

  border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 0, color: Colors.transparent));
  }
}
