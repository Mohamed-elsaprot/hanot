import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/managers/single_products_details_cubit/single_products_details_state.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/models/single_sku_details/SingleSkuDetails.dart';

import '../../data/single_product_repo/single_product_repo_impl.dart';
import '../../models/single_product_model/SingleProductModel.dart';

class SingleProductCubit extends Cubit<SingleProductDetailsState>{
  SingleProductCubit(this.singleProductRepoImpl):super(SingleProductDetailsInitial());
  final SingleProductRepoImpl singleProductRepoImpl;

  late SingleProductModel singleProductModel;
  late List productOptionsList;

  num count = 1;
  late List<int> selectedOptionsIndex;

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
      selectedOptionsIndex = List.generate(singleProductModel.options!.length, (x)=>0);
      emit(SingleProductDetailsSuccess());
    });
  }

  setOption(int optionIndex,int optionId){
    productOptionsList[optionIndex]=optionId;
  }

  setNewSingleProductVal({required SingleSkuDetails sku,bool resetCount=true}){
    // print(singleProductModel.hasDiscountPrice);
    // print(singleProductModel.discountPrice);
    // print(singleProductModel.salePrice);
    if(resetCount)count=1;
    singleProductModel.quantity= sku.quantity;
    singleProductModel.salePrice= sku.salePrice;
    singleProductModel.discountPrice= sku.discountPrice;
    singleProductModel.hasDiscountPrice= sku.hasDiscountPrice;
    // print('-----------');
    // print(singleProductModel.hasDiscountPrice);
    // print(singleProductModel.discountPrice);
    // print(singleProductModel.salePrice);
  }
}