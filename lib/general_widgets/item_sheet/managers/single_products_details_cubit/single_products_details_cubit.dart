import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/general_widgets/item_sheet/data/single_product_repo/single_product_repo_impl.dart';
import 'package:hanot/general_widgets/item_sheet/managers/single_products_details_cubit/single_products_details_state.dart';

import '../../models/single_product_model/SingleProductModel.dart';

class SingleProductCubit extends Cubit<SingleProductDetailsState>{
  SingleProductCubit(this.singleProductRepoImpl):super(SingleProductDetailsInitial());
  final SingleProductRepoImpl singleProductRepoImpl;

  late SingleProductModel singleProductModel;

  getSingleProduct({required String id})async{
    emit(SingleProductDetailsLoading());
    var res = await singleProductRepoImpl.getSingleProductModel(id: id);
    res.fold((failure){
      emit(SingleProductDetailsFailure(errorMessage: failure.errorMessage));
    }, (model){
      singleProductModel=model;
      emit(SingleProductDetailsSuccess());
    });
  }

}