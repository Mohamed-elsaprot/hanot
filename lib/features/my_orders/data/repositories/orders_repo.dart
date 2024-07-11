
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/my_orders/data/models/orders_model.dart';

import '../../../../core/errors/failure.dart';

class OrdersRepo {
  //=================================================================================
  // To get all orders or to get first page of orders
  Future<Either<Failure, OrdersModel>> getOrders() async {
    try {
      var response = await ApiService.getOrders(link: '/orders');
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
  Future<Either<Failure, OrdersModel>> getNextPageOrders(
      {required String link}) async {
    try {
      var response = await ApiService.getNextPageOrders(link: link);
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
