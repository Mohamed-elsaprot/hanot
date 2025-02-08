import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/favorites/data/models/get_favorites_model.dart';
import 'package:hanot/features/favorites/manager/fav_state.dart';

import '../../../core/design/fun.dart';
import '../../../core/models/category_model/Product.dart';
import '../data/repositories/get_favorites_repo.dart';

class FavCubit extends Cubit<FavState> {
  FavCubit({required this.getFavoritesRepo}) : super(FavInitial());
  late GetFavoritesRepo getFavoritesRepo;
  late GetFavoritesModel favoritesModel;
  bool last = false;
  late int changedId;

  Future<void> getFavorites() async {
    emit(FavoritesLoading());
      var result = await getFavoritesRepo.getFavorites();
      result.fold((failure) {
        emit(FavoritesFailure(errorMessage: failure.errorMessage));
      }, (favModel) {
        favoritesModel = favModel;
        emit(FavoritesSuccess());
      });
  }

  getNextPageFavorites(BuildContext context) async {
    emit(NextFavoritesLoading());
    if (favoritesModel.links!.next != null) {
      List<FavItemModel> cache = favoritesModel.favItemsList!;
      var res = await getFavoritesRepo.getCurrentNextPageOrders(
          link: favoritesModel.links!.next!);
      res.fold((failure) {
        errorDialog(context: context, message: failure.errorMessage);
      }, (favModel) {
        cache.addAll(favModel.favItemsList!);
        favoritesModel = favoritesModel.copyWith(links: favModel.links, meta: favModel.meta, data: cache);
      });
    } else {
      last = true;
    }
    emit(FavoritesSuccess());
  }

  setFavNewVal({required int productId,required bool favVal,bool fromFavScreen=false}) async {
    emit(ChangeFavValLoading());
    changedId = productId;
    var res = favVal? await getFavoritesRepo.removeFav(productId: productId): await getFavoritesRepo.setFav(productId: productId);
    res.fold((failure){
      emit(ChangeFavValFailure(errorMessage: failure.errorMessage));
    }, ((x){
      emit(ChangeFavValSuccess());
      fromFavScreen?getFavorites():null;
    }));

  }

  removeFromFavList({required int index}){
    favoritesModel.favItemsList!.removeAt(index);
    emit(FavoritesSuccess());
  }
}
