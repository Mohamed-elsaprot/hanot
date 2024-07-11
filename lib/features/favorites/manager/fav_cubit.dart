import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hanot/features/favorites/data/models/get_favorites_model.dart';
import 'package:hanot/features/favorites/manager/fav_state.dart';

import '../../../core/design/fun.dart';
import '../../../core/models/category_model/Product.dart';
import '../data/repositories/get_favorites_repo.dart';

class FavCubit extends Cubit<FavState> {
  late GetFavoritesRepo getFavoritesRepo;
  late GetFavoritesModel favoritesModel;
  bool last = false;
  FavCubit({required this.getFavoritesRepo}) : super(FavInitial());
  List<Product> favList = [
    Product(
        name: 'product 1',
        costPrice: 100,
        discountPrice: 120,
        id: 1,
        salePrice: 150,
        quantity: 10,
        image:
            'https://hips.hearstapps.com/hmg-prod/images/2020-03-10-use-a-drill-final-clean-00-01-57-10-still053-1584632505.jpg'),
    Product(
        name: 'product 2',
        costPrice: 34,
        discountPrice: 55,
        id: 0,
        salePrice: 122,
        quantity: 3,
        image:
            'https://hips.hearstapps.com/hmg-prod/images/2020-03-10-use-a-drill-final-clean-00-01-57-10-still053-1584632505.jpg'),
    Product(
        name: 'product 3',
        costPrice: 65,
        discountPrice: 44,
        id: 9,
        salePrice: 1233,
        quantity: 5,
        image:
            'https://hips.hearstapps.com/hmg-prod/images/2020-03-10-use-a-drill-final-clean-00-01-57-10-still053-1584632505.jpg'),
  ];

  changeFavList({required int index, required Product product}) {
    if (index == -1) {
      favList.add(product);
    } else {
      favList.removeAt(index);
    }
    emit(FavInitial());
  }

  Future<void> getFavorites() async {
    emit(FavoritesLoading());
    try {
      var result = await getFavoritesRepo.getFavorites();

      result.fold((failure) {
        emit(FavoritesFailure(errorMessage: failure.errorMessage));
      }, (favModel) {
        favoritesModel = favModel;

        emit(FavoritesSuccess(favorites: favModel));
      });
    } catch (e) {
      emit(FavoritesFailure(errorMessage: e.toString()));
    }
  }

  getNextPageFavorites(BuildContext context) async {
    if (favoritesModel.links!.next != null) {
      List<Data> cache = favoritesModel.data!;
      var res = await getFavoritesRepo.getCurrentNextPageOrders(
          link: favoritesModel.links!.next!);
      res.fold((failure) {
        errorDialog(context: context, message: failure.errorMessage);
      }, (favModel) {
        cache.addAll(favModel.data!);
        favoritesModel = favoritesModel.copyWith(
            links: favModel.links, meta: favModel.meta, data: cache);
      });
    } else {
      last = true;
    }
    emit(FavoritesSuccess(favorites: favoritesModel));
  }
}
