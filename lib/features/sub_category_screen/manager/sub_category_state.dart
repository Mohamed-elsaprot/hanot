abstract class SubCategoryState{}

class SubCategoryInitial extends SubCategoryState{}
class SubCategoryLoading extends SubCategoryState{}
class SubCategorySuccess extends SubCategoryState{}
class SubCategoryFailure extends SubCategoryState{
  SubCategoryFailure({required this.errorMessage});
  final String errorMessage;
}