abstract class FilterState {}

final class FilterInitial extends FilterState {}
final class FilterLoading extends FilterState {}
final class FilterSuccess extends FilterState {}
final class FilterFailure extends FilterState {
  final String errorMessage;
  FilterFailure({required this.errorMessage});
}
