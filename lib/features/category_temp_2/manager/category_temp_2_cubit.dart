import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/core/models/category_model/Product.dart';
import 'package:hanot/features/categories/model/SmallCategoryModel.dart';

import '../main_cat_repo/main_car_repo.dart';
import 'category__temp_2_state.dart';

class CategoryTemp2Cubit extends Cubit<CategoryTemp2State> {
  CategoryTemp2Cubit(this.repo) : super(CategoryTemp2Initial());
  final CatTemp2Repo repo;
  List<SmallCategoryModel> catList=[];
  List<Product> productsList=[];
  bool isCat=true;

  getMainCatDetails({required String catId})async{
    emit(CategoryTemp2Loading());
    var res = await repo.getCategoryDetails(catId: catId);
    res.fold((failure)=>emit(CategoryTemp2Failure(errorMessage: failure.errorMessage)), (map){
      map['type']=='categories'?
          catList = map['list'] : productsList = map['list'];
      isCat= map['type']=='categories'? true: false;
      emit(CategoryTemp2Success());
    });
  }
}
