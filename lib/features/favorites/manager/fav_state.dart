
abstract class FavState {}

class FavInitial extends FavState {}

final class FavoritesSuccess extends FavState {}
final class FavoritesFailure extends FavState {
  final String errorMessage;
  FavoritesFailure({required this.errorMessage});
}

final class FavoritesLoading extends FavState {}
final class NextFavoritesLoading extends FavState {}

final class ChangeFavValLoading extends FavState {}
final class ChangeFavValSuccess extends FavState {}
final class ChangeFavValFailure extends FavState {
  ChangeFavValFailure({required this.errorMessage});
  final String errorMessage;
}