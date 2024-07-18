import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../core/design/app_styles.dart';
import '../../../../core/design/images.dart';

class FavEmpty extends StatelessWidget {
  const FavEmpty({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(Images.favEmpty,height: 100.h,),
          SizedBox(height: 10.h,),
          Styles.text(textsMap['mobile_youDidNotAddAnyProduct']),
          SizedBox(height: 10.h,),
          Styles.subTitle(textsMap['mobile_favEmptyQuote'],size: 13)
        ],
      ),
    );
  }
}
