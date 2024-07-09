import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/check_out_screen/data/payment_method_repo/payment_method_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/payment_method_cubit/paymentMethod_state.dart';

import '../../models/payment_method_model/PaymentMethodModel.dart';

class PaymentMethodCubit extends Cubit<PaymentMethodState>{
  PaymentMethodCubit(this.paymentMethodRepoImpl):super(PaymentMethodInitial());
  final PaymentMethodRepoImpl paymentMethodRepoImpl;
  List<PaymentMethodModel> paymentMethodsList=[];
  PaymentMethodModel? selectedPaymentMethod;
  String groupVal='cod';
  getPaymentMethods({required BuildContext context})async{
    emit(PaymentMethodLoading());
    var res = await paymentMethodRepoImpl.getPaymentMethods();
    res.fold((failure){
      errorDialog(context: context, message: failure.errorMessage);
      emit(PaymentMethodFailure(errorMessage: failure.errorMessage));
    }, (list){
      paymentMethodsList = list;
      if(list.isNotEmpty){
        groupVal=list[0].slug!;
        selectedPaymentMethod = list[0];
      }
      emit(PaymentMethodSuccess());
    });
  }
  setSelectedPaymentMethod(int index){
    selectedPaymentMethod = paymentMethodsList[index];
  }
}