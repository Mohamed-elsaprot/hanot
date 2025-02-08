import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/check_cart_repo/check_cart_repo.dart';
import 'check_cart_state.dart';

class CheckCartCubit extends Cubit<CheckCartState> {
  CheckCartCubit(this.repo) : super(CheckCartInitial());
  final CheckCartRepo repo;

  Future checkCart()async{
    emit(CheckCartLoading());
    var res = await repo.checkCart();
    res.fold((failure)=>emit(CheckCartFailure(errorMessage: failure.errorMessage)), (check){
      emit(CheckCartSuccess(check: check));
    });
  }

}
