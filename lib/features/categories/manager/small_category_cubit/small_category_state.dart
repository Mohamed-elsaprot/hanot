abstract class SmallCategoryState{}

class SmallCategoryInitial extends SmallCategoryState{}
class SmallCategoryLoading extends SmallCategoryState{}
class SmallCategorySuccess extends SmallCategoryState{}
class SmallCategoryFailure extends SmallCategoryState{
  SmallCategoryFailure({required this.errorMessage});
  final String errorMessage;
}