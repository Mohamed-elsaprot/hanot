import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/general_widgets/item_sheet/data/single_product_repo/single_product_repo_impl.dart';
import 'package:hanot/general_widgets/item_sheet/managers/single_sku_details_cubit/single_sku_details_state.dart';
import 'package:hanot/general_widgets/item_sheet/models/single_sku_details/SingleSkuDetails.dart';

class SkuDetailsCubit extends Cubit<SkuDetailsState>{
  SkuDetailsCubit(this.singleProductRepoImpl):super(SkuDetailsInitial());
  final SingleProductRepoImpl singleProductRepoImpl;
  late SingleSkuDetails skuDetails;

  getSkuDetails({required Map body})async{
    emit(SkuDetailsLoading());
    var res = await singleProductRepoImpl.checkSkuDetails(body: body);
    res.fold((failure){
      emit(SkuDetailsFailure(errorMessage: failure.errorMessage));
    }, (model){
      skuDetails=model;
      emit(SkuDetailsSuccess());
    });
  }
}