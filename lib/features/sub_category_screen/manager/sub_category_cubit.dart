import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/sub_category_screen/manager/sub_category_state.dart';

import '../../../core/design/fun.dart';
import '../../tabs_screen/data/get_category_products_repo/products_repo_impl.dart';
import '../../tabs_screen/data/next_page_products_repo/next_page_products_repo_impl.dart';
import '../../tabs_screen/model/category_model/CategoryModel.dart';
import '../../tabs_screen/model/category_model/Product.dart';

class SubCategoryCubit extends Cubit<SubCategoryState>{
  SubCategoryCubit(this.productsRepoImpl, this.nextPageProductsRepoImpl):super(SubCategoryInitial());

  final ProductsRepoImpl productsRepoImpl;
  final NextPageProductsRepoImpl nextPageProductsRepoImpl;
  late CategoryProductsModel subCategoryModel;
  late int lastCategoryIndex;
  bool last =false;

  getCategoryProducts({required String subCatId,})async{
    last=false;
    emit(SubCategoryLoading());
    var res = await productsRepoImpl.getCategoryProducts(catId: subCatId);
    res.fold((failure) {
      emit(SubCategoryFailure(errorMessage: failure.errorMessage));
    }, (catModel) {
      subCategoryModel = catModel;
      emit(SubCategorySuccess());
    });
  }

  getNextPageProducts(BuildContext context)async{
    if(subCategoryModel.links!.next != null){
      List<Product> cache = subCategoryModel.productsList!;
      var res = await nextPageProductsRepoImpl.getNextPageProducts(nextLink: subCategoryModel.links!.next!);
      res.fold((failure){
        errorDialog(context: context, message: failure.errorMessage);
      }, (catModel){
        cache.addAll(catModel.productsList!);
        subCategoryModel = subCategoryModel.copyWith(links: catModel.links,meta: catModel.meta,message: catModel.message,list: cache);
      });
    }else{
      last = true;
    }
    emit(SubCategorySuccess());
  }

}