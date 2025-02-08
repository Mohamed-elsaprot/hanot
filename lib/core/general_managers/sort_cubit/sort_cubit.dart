import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/general_managers/sort_cubit/sort_state.dart';

class SortCubit extends Cubit<SortState> {
  SortCubit() : super(SortInitial());
  int sortIndex=-1;
}
