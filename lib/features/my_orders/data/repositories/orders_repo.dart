import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/my_orders/data/models/orders_model.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/services/localization.dart';

class OrdersRepo {
  //=================================================================================

  // To get all orders or to get first page of orders
  Future<Either<Failure, List<MyOrderModel>>> getCurrentOrders() async {
    try {
      var response = await ApiService.getDataWithToken(endPoint: ApiService.currentOrders,);
      List<MyOrderModel> list=[];
      response.forEach((x)=> list.add(MyOrderModel.fromJson(x)));
      return right(list);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

  //=================================================================================

  // To get all orders or to get first page of orders
  Future<Either<Failure, OrdersModelRes>> getPrevOrders() async {
    try {
      var response = await ApiService.getDataWithToken(endPoint: ApiService.prevOrders, perPage: '10');
      OrdersModelRes result = OrdersModelRes.fromJson(response);
      return Right(result);
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
  Future<Either<Failure, OrdersModelRes>> getPrevNextPageOrders(
      {required String link}) async {
    try {
      var response = await ApiService.getNextPage(link: link, perPage: '10');
      var result = OrdersModelRes.fromJson(response);
      return Right(result);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }
}
