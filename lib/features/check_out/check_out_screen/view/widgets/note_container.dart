import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/features/lang/manager/lang_cubit.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../general_widgets/custom_textField.dart';
import '../../manager/note_cubit/note_cubit.dart';
import 'custom_continer.dart';

class NoteContainer extends StatelessWidget {
  const NoteContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Map textsMap = BlocProvider.of<LangCubit>(context).texts;
    var noteCubit = BlocProvider.of<NoteCubit>(context);
    return CustomContainer(
        body: [
          Styles.text(textsMap['mobile_Do_you_have_a_note_on_the_order?']),
          SizedBox(height: 8.h,),
          CustomTextField(hint: textsMap['mobile_Add_Note'],icon: const Icon(CupertinoIcons.chat_bubble_2), controller: noteCubit.noteController)
        ]
    );
  }
}
