class CategoryTemp2State {}

final class CategoryTemp2Initial extends CategoryTemp2State {}
final class CategoryTemp2Loading extends CategoryTemp2State {}
final class CategoryTemp2Success extends CategoryTemp2State {}
final class CategoryTemp2Failure extends CategoryTemp2State {
  final String errorMessage;
  CategoryTemp2Failure({required this.errorMessage});
}
