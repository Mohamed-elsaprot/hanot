import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';
import 'package:hanot/general_widgets/settings_textScaffold.dart';

import '../../../../../core/design/app_styles.dart';

class TermsButton extends StatelessWidget {
  const TermsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: FittedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Styles.text(textsMap['mobile_By_continuing_you_agree_to'],size: 11),
            GestureDetector(
                onTap: (){
                  // bottomSheet(context, SizedBox(height: 500.h,child: const SettingsTextsScaffold(fromSheet: true,)));
                },
                child: Styles.text(textsMap['mobile_terms_and_Conditions'],color: const Color(0xffFF9500),size: 11)),
            const SizedBox(width: 2,),
            Styles.text(textsMap['mobile_store_specific'],size: 11),
          ],
        ),
      ),
    );
  }
}
