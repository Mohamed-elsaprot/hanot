abstract class GetCategoryProductsState{}

class GetCategoryProductsInitial extends GetCategoryProductsState{}
class GetCategoryProductsLoading extends GetCategoryProductsState{}
class GetCategoryProductsSuccess extends GetCategoryProductsState{}
class GetCategoryProductsFailure extends GetCategoryProductsState{
  GetCategoryProductsFailure({required this.errorMessage});
  final String errorMessage;
}