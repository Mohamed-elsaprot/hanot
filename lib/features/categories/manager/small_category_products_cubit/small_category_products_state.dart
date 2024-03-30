abstract class SmallCategoryProductsState{}

class SmallCategoryProductsInitial extends SmallCategoryProductsState{}
class SmallCategoryProductsLoading extends SmallCategoryProductsState{}
class SmallCategoryProductsSuccess extends SmallCategoryProductsState{}
class SmallCategoryProductsFailure extends SmallCategoryProductsState{
  SmallCategoryProductsFailure({required this.errorMessage});
  final String errorMessage;
}