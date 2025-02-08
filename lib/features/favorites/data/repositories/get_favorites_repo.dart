import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../../../../core/services/localization.dart';
import '../models/get_favorites_model.dart';

class GetFavoritesRepo {
  //=================================================================================

  // To get all orders or to get first page of favorites
  Future<Either<Failure, GetFavoritesModel>> getFavorites() async {
    try {
      var response = await ApiService.getDataWithToken(
          endPoint: '/favorites', perPage: '10');
      GetFavoritesModel result = GetFavoritesModel.fromJson(response);
      return right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

  //=================================================================================

  // To get next page of orders.
  Future<Either<Failure, GetFavoritesModel>> getCurrentNextPageOrders(
      {required String link}) async {
    try {
      var response = await ApiService.getNextPage(link: link, perPage: '10');
      var result = GetFavoritesModel.fromJson(response);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

  Future<Either<Failure, dynamic>> setFav({required int productId}) async {
    try {
      var response = await ApiService.postDataWithToken(endPoint: ApiService.favorites, postedData: {"product_id": productId});
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }
  
  Future<Either<Failure, dynamic>> removeFav({required int productId}) async {
    try {
      var response = await ApiService.delete(endPoint: '${ApiService.favorites}/$productId');
      return Right(response);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }
}
