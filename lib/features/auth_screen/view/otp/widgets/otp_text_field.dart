import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/consts.dart';
import 'package:hanot/features/auth_screen/manager/auth_state.dart';
import 'package:hanot/features/cart/manager/cart_cubit/cart_cubit.dart';

import '../../../../lang/manager/lang_cubit.dart';
import '../../../manager/auth_cubit.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({Key? key, required this.focusNode,}) : super(key: key);
  final FocusNode focusNode;
  @override
  Widget build(BuildContext context) {
    var textsMap = BlocProvider.of<LangCubit>(context).texts;
    var authCubit = BlocProvider.of<AuthCubit>(context);
    return BlocListener<AuthCubit,AuthState>(listener: (context,state){
      if(authCubit.isAuth){
        var cartCubit = BlocProvider.of<CartCubit>(context);
        cartCubit.getCartProducts();
      }
    },child: TextFormField(
      validator: (x){
        if(x==null || x.isEmpty || x.length!=4){
          return textsMap['mobile_pleaseEnter4Num'];
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
    ),);
  }

  border() {
    return OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(width: 0, color: Colors.transparent));
  }
}
