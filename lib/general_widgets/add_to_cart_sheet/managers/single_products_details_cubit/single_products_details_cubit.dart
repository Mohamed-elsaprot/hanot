import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/single_products_details_cubit/single_products_details_state.dart';

import '../../data/single_product_repo/single_product_repo_impl.dart';
import '../../models/single_product_model/SingleProductModel.dart';

class SingleProductCubit extends Cubit<SingleProductDetailsState>{
  SingleProductCubit(this.singleProductRepoImpl):super(SingleProductDetailsInitial());
  final SingleProductRepoImpl singleProductRepoImpl;

  late SingleProductModel singleProductModel;
  late List productOptionsList;
  getSingleProduct({required String id})async{
    emit(SingleProductDetailsLoading());
    var res = await singleProductRepoImpl.getSingleProductModel(id: id);
    res.fold((failure){
      emit(SingleProductDetailsFailure(errorMessage: failure.errorMessage));
    }, (model){
      singleProductModel=model;
      productOptionsList=List.generate(singleProductModel.options!.length, (index){
        return singleProductModel.options![index].values![0].id!.toInt();
      });
      emit(SingleProductDetailsSuccess());
    });
  }

  setOption(int optionIndex,int optionId){
    productOptionsList[optionIndex]=optionId;
  }

}