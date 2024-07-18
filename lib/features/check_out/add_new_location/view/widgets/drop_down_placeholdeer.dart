import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../../core/design/fun.dart';

class DropDownPlaceHolder extends StatelessWidget {
  const DropDownPlaceHolder({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    return DropdownButtonFormField(
      validator: (x){
        if(x==null){
          return textsMap['mobile_required'];
        }else {
          return null;
        }
      },
      decoration: dropDownButtonBorderDecoration(),
      menuMaxHeight: 250.h,
      items: [],
      onChanged: (x){},
    );
  }
}
