import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/check_out/check_out_screen/data/shipping_companies_repo/shipping_companies_repo_impl.dart';
import 'package:hanot/features/check_out/check_out_screen/manager/shipping_fees_cubit/shipping_fees_state.dart';
import 'package:hanot/features/check_out/check_out_screen/models/shipping_fees_model/ShippingFeesModel.dart';

class ShippingFeesCubit extends Cubit<ShippingFeesState>{
  ShippingFeesCubit(this.shippingCompaniesRepoImpl):super(ShippingFeesInitial());
  final ShippingCompaniesRepoImpl shippingCompaniesRepoImpl;

  ShippingFeesModel? shippingFeesModel;
  getShippingFees({required num priceId,required BuildContext context})async{
    emit(ShippingFeesLoading());
    var res = await shippingCompaniesRepoImpl.getShippingFees(priceId: priceId);
    res.fold((failure){
      errorDialog(context: context, message: failure.errorMessage);
      emit(ShippingFeesFailure(errorMessage: failure.errorMessage));
    }, (model){
      shippingFeesModel = model;
      emit(ShippingFeesSuccess());
    });
  }
}