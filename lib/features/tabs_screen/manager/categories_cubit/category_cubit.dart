import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/get_categories_details_repo/category_repo_impl.dart';
import '../../model/category_details/CategoryDetails.dart';
import 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState>{
  CategoryCubit(this.categoryRepoImpl):super(CategoryInitial());
  final CategoryDetailsRepoImpl categoryRepoImpl;
  List<CategoryDetails> tabBarCategoriesList=[];
  getCategories()async{
    emit(CategoryLoading());
    var res = await categoryRepoImpl.getCategories();
    res.fold((failure) {
      emit(CategoryFailure(errorMessage: failure.errorMessage));
    }, (list) {
      tabBarCategoriesList=list;
      emit(CategorySuccess());
    });
  }
}