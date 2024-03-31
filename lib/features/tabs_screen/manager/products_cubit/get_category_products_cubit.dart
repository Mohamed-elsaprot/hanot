import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';

import '../../data/get_category_products_repo/products_repo_impl.dart';
import '../../data/next_page_products_repo/next_page_products_repo_impl.dart';
import '../../model/category_model/CategoryModel.dart';
import '../../model/category_model/Product.dart';
import 'get_category_products_state.dart';

class CategoryProductsCubit extends Cubit<GetCategoryProductsState>{
  CategoryProductsCubit(this.productsRepoImpl, this.nextPageProductsRepoImpl):super(GetCategoryProductsInitial());
  final ProductsRepoImpl productsRepoImpl;
  final NextPageProductsRepoImpl nextPageProductsRepoImpl;
  CategoryProductsModel? categoryModel;
  bool last =false;

  getCategoryProducts({required String catId,})async{
    last=false;
    emit(GetCategoryProductsLoading());
    var res = await productsRepoImpl.getCategoryProducts(catId: catId);
    res.fold((failure) {
      emit(GetCategoryProductsFailure(errorMessage: failure.errorMessage));
    }, (catModel) {
      categoryModel = catModel;
      emit(GetCategoryProductsSuccess());
    });
  }

  getNextPageProducts(BuildContext context)async{
    if(categoryModel!.links!.next != null){
      List<Product> cache = categoryModel!.productsList!;
     var res = await nextPageProductsRepoImpl.getNextPageProducts(nextLink: categoryModel!.links!.next!);
     res.fold((failure){
       errorDialog(context: context, message: failure.errorMessage);
     }, (catModel){
       cache.addAll(catModel.productsList!);
       categoryModel = categoryModel!.copyWith(links: catModel.links,meta: catModel.meta,message: catModel.message,list: cache);
     });
    }else{
      last = true;
    }
    emit(GetCategoryProductsSuccess());
  }
}