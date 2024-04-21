import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/note_cubit/note_state.dart';

class NoteCubit extends Cubit<NoteState>{
  NoteCubit():super(NoteInitial());
  TextEditingController noteController = TextEditingController();
}