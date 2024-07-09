import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../general_widgets/custom_textField.dart';
import '../../manager/note_cubit/note_cubit.dart';
import 'custom_continer.dart';

class NoteContainer extends StatelessWidget {
  const NoteContainer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var noteCubit = BlocProvider.of<NoteCubit>(context);
    return CustomContainer(
        body: [
          Styles.text(Texts.doYouHaveNoteOnOrder.tr()),
          SizedBox(height: 8.h,),
          CustomTextField(hint: Texts.addNote.tr(),icon: const Icon(CupertinoIcons.chat_bubble_2), controller: noteCubit.noteController)
        ]
    );
  }
}
