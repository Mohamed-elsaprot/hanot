import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/my_orders/data/models/orders_model.dart';

import '../../../../core/errors/failure.dart';

class OrdersRepo {
  //=================================================================================

  // To get all orders or to get first page of orders
  Future<Either<Failure, OrdersModel>> getCurrentOrders() async {
    try {
      var response =
          await ApiService.getDataWithToken(endPoint: '/orders', perPage: '10');
      OrdersModel result = OrdersModel.fromJson(response);
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
  Future<Either<Failure, OrdersModel>> getCurrentNextPageOrders(
      {required String link}) async {
    try {
      var response = await ApiService.getNextPage(link: link, perPage: '10');
      var result = OrdersModel.fromJson(response);
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
