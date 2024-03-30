import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/categories/manager/small_category_cubit/small_category_state.dart';

import '../../data/small_category_model/small_category_repo_impl.dart';
import '../../model/SmallCategoryModel.dart';

class SmallCategoryCubit extends Cubit<SmallCategoryState>{
  SmallCategoryCubit(this.smallCategoryRepoImpl):super(SmallCategoryInitial());
  List<SmallCategoryModel> smallCategoryList=[];
  final SmallCategoryRepoImpl smallCategoryRepoImpl;
  getSmallCategories()async{
    emit(SmallCategoryLoading());
    var res = await smallCategoryRepoImpl.getSmallCategories();
    res.fold((failure) {
      emit(SmallCategoryFailure(errorMessage: failure.errorMessage));
    }, (list) {
      smallCategoryList = list;
      emit(SmallCategorySuccess());
    });
  }
}