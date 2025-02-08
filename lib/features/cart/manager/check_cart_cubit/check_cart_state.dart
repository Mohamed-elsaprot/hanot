abstract class CheckCartState {}

final class CheckCartInitial extends CheckCartState {}
final class CheckCartLoading extends CheckCartState {}
final class CheckCartSuccess extends CheckCartState {
  CheckCartSuccess({required this.check});
  final bool check;
}
final class CheckCartFailure extends CheckCartState {
  final String errorMessage;
  CheckCartFailure({required this.errorMessage});
}
