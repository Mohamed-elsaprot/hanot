abstract class CategoryState{}

class CategoryInitial extends CategoryState{}
class CategorySuccess extends CategoryState{}
class CategoryFailure extends CategoryState{
  CategoryFailure({required this.errorMessage});
  final String errorMessage;
}
class CategoryLoading extends CategoryState{}