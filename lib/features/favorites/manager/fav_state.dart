import '../data/models/get_favorites_model.dart';

abstract class FavState {}

class FavInitial extends FavState {}

final class FavoritesSuccess extends FavState {
  final GetFavoritesModel favorites;
  FavoritesSuccess({required this.favorites});
}

final class FavoritesFailure extends FavState {
  final String errorMessage;
  FavoritesFailure({required this.errorMessage});
}

final class FavoritesLoading extends FavState {}
final class NextFavoritesLoading extends FavState {}
