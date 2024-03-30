import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/design/fun.dart';
import 'package:hanot/features/categories/data/single_category_repo/single_category_repo_impl.dart';
import 'package:hanot/features/categories/manager/small_category_products_cubit/small_category_products_state.dart';
import 'package:hanot/features/tabs_screen/model/category_details/CategoryDetails.dart';
import '../../../tabs_screen/data/get_category_products_repo/products_repo_impl.dart';
import '../../../tabs_screen/data/next_page_products_repo/next_page_products_repo_impl.dart';
import '../../../tabs_screen/model/category_model/CategoryModel.dart';
import '../../../tabs_screen/model/category_model/Product.dart';



class SmallCategoryProductsAndChildrenCubit extends Cubit<SmallCategoryProductsState>{
  SmallCategoryProductsAndChildrenCubit(this.productsRepoImpl, this.nextPageProductsRepoImpl, this.singleCategoryRepoImpl):super(SmallCategoryProductsInitial());
  final ProductsRepoImpl productsRepoImpl;
  final NextPageProductsRepoImpl nextPageProductsRepoImpl;
  final SingleCategoryRepoImpl singleCategoryRepoImpl;
  late CategoryProductsModel categoryProductsModel;
  late CategoryDetails categoryDetails;
  late int lastCategoryIndex;
  bool last = false;

  getCategoryProducts({required String catId,})async{
    last=false;
    emit(SmallCategoryProductsLoading());
    var res = await productsRepoImpl.getCategoryProducts(catId: catId);
    res.fold((failure) {
      emit(SmallCategoryProductsFailure(errorMessage: failure.errorMessage));
    }, (catModel) {
      categoryProductsModel = catModel;
      getSingleCategory(catId);
    });
  }

  getSingleCategory(String catId)async{
    var res = await singleCategoryRepoImpl.getSingleCategory(catId: catId);
    res.fold((failure) {
      emit(SmallCategoryProductsFailure(errorMessage: failure.errorMessage));
    }, (catDetails) {
      categoryDetails = catDetails;
      emit(SmallCategoryProductsSuccess());
    });
  }

  getNextPageProducts(BuildContext context)async{
    if(categoryProductsModel.links!.next != null){
      List<Product> cache = categoryProductsModel.productsList!;
      var res = await nextPageProductsRepoImpl.getNextPageProducts(nextLink: categoryProductsModel.links!.next!);
      res.fold((failure){
        customDialog(context: context, message: failure.errorMessage);
      }, (catModel){
        cache.addAll(catModel.productsList!);
        categoryProductsModel = categoryProductsModel.copyWith(links: catModel.links,meta: catModel.meta,message: catModel.message,list: cache);
      });
    }else{
      last = true;
    }
    emit(SmallCategoryProductsSuccess());
  }
}