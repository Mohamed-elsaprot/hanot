import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/check_out_screen/data/check_out_repo/check_out_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/check_out_cubit/check_out_state.dart';
import 'package:hanot/features/check_out/check_out_screen/models/order_model/OrderModel.dart';

class CheckOutCubit extends Cubit<CheckOutState>{
  CheckOutCubit(this.checkOutRepoImpl):super(CheckOutInitial());
  final CheckOutRepoImpl checkOutRepoImpl;
  late OrderModel orderModel;
  sendOrder({
    required BuildContext context,
    required String paymentMethod,
    required String deliveryMethod,
    required String notes,
    required num? addressId,
    required num? priceId
  })async{
    emit(CheckOutLoading());
    var res = await checkOutRepoImpl.sendOrder(paymentMethod: paymentMethod, deliveryMethod: deliveryMethod, notes: notes, addressId: addressId, priceId: priceId);
    res.fold((failure){
      errorDialog(context: context, message: failure.errorMessage);
      emit(CheckOutFailure(errorMessage: failure.errorMessage));
    }, (model){
      orderModel = model;
      emit(CheckOutSuccess());
    });
  }
}