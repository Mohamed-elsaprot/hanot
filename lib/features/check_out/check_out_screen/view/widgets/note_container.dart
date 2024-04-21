import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hanot/core/design/appTexts.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/note_cubit/note_state.dart';
import 'package:hanot/general_widgets/custom_button.dart';

import '../../../../../core/design/app_styles.dart';
import '../../../../../core/design/fun.dart';
import '../../manager/note_cubit/note_cubit.dart';
import 'note_screen.dart';

class NoteContainer extends StatelessWidget {
  const NoteContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var noteCubit = BlocProvider.of<NoteCubit>(context);
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.grey.shade200
      ),
      padding: EdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Styles.text(Texts.orderNote.tr(),size: 11),
              SizedBox(width:200.w,height: 25.h,child: Styles.text(noteCubit.noteController.text.isNotEmpty?
              noteCubit.noteController.text:Texts.noNotesAdded.tr(),overflow: TextOverflow.ellipsis))
            ],
          ),
          const Spacer(),
          CustomButton(fun: (){
            bottomSheet(context, NoteScreen(controller: noteCubit.noteController),fun: ()=> noteCubit.emit(NoteInitial()));
          }, title: noteCubit.noteController.text.isNotEmpty?Texts.edit.tr():Texts.addNote.tr(),padding: EdgeInsets.symmetric(horizontal: 12.h,vertical: 8.w),rad: 8,)
        ],
      ),
    );
  }
}
