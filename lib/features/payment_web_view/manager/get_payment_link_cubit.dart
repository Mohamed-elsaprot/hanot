import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/payment_web_view/data/get_payment_link_repo_impl.dart';
import 'package:hanot/features/payment_web_view/manager/get_payment_link_state.dart';

class GetPaymentLinkCubit extends Cubit<GetPaymentLinkState>{
  GetPaymentLinkCubit(this.getPaymentLinkRepoImpl):super(GetPaymentLingInitial());
  final GetPaymentLinkRepoImpl getPaymentLinkRepoImpl;

  getLink(int orderId,BuildContext c)async{
    emit(GetPaymentLingLoading());
    var res = await getPaymentLinkRepoImpl.getPaymentLink(orderId: orderId);
    res.fold((failure){
      errorDialog(context: c, message: failure.errorMessage);
      emit(GetPaymentLingFailure(errorMessage: failure.errorMessage));
    }, (link){
      if(link.isEmpty){
        emit(GetPaymentLingFailure(errorMessage: 'Something went wrong.'));
      }else{
        emit(GetPaymentLingSuccess(link: link));
      }
    });
  }
}