import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/check_out_cubit/check_out_state.dart';

class CheckOutCubit extends Cubit<CheckOutState>{
  CheckOutCubit():super(CheckOutInitial());
}