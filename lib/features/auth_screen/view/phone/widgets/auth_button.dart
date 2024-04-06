import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/widgets.dart';
import 'package:hanot/features/auth_screen/manager/auth_cubit.dart';
import 'package:hanot/features/auth_screen/manager/auth_state.dart';

import '../../../../../core/design/app_styles.dart';


class AuthButton extends StatelessWidget {
  const AuthButton({Key? key,required this.fun, required this.title,this.textSize=15, this.rad=50,}) : super(key: key);
  final void Function() fun;
  final String title;
  final double textSize;
  final double? rad;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
          padding:EdgeInsets.symmetric(vertical: 10.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(rad!.r,),
            side: const BorderSide(color:Colors.black26,width: 1.5),
          ),
          backgroundColor: Styles.primary
      ),
      onPressed: fun,
      child: BlocBuilder<AuthCubit,AuthState>(builder: (context,state){
        if(state is AuthLoading){
          return loadingIndicator(rad: 25,color: Colors.white);
        }else{
          return Styles.text(title,color:Colors.white,size: textSize);
        }
      }),
    );
  }
}
