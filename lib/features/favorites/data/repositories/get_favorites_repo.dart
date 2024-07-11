import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/api_service.dart';
import '../models/get_favorites_model.dart';

class GetFavoritesRepo {

  //=================================================================================
  
  // To get all orders or to get first page of favorites
  Future<Either<Failure, GetFavoritesModel>> getFavorites() async {
    try {
      var response = await ApiService.getDataWithToken(endPoint: '/favorites',perPage: '15');
      GetFavoritesModel result = GetFavoritesModel.fromJson(response);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

  //=================================================================================

  // To get next page of orders.
  Future<Either<Failure, GetFavoritesModel>> getCurrentNextPageOrders(
      {required String link}) async {
    try {
      var response = await ApiService.getNextPage(link: link,perPage: '15');
      var result = GetFavoritesModel.fromJson(response);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }
}
