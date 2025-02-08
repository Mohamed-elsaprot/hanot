import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/features/my_orders/data/models/orders_model.dart';
import 'package:hanot/features/order_details/models/single_order.dart';

import '../../../core/errors/failure.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/localization.dart';
import '../models/SingleOrderDetails.dart';

class GetSingleOrderRepo {
  Future<Either<Failure, SingleOrder>> getSingleOrder({required int orderId}) async {
    try {
      SingleOrder singleOrder;
      List<SingleOrderItem> list=[];
      var response = await ApiService.getDataWithToken(endPoint: '/orders/$orderId',);
      response['details'].forEach((x)=> list.add(SingleOrderItem.fromJson(x)));
      singleOrder= SingleOrder(orderModel: MyOrderModel.fromJson(response['order']), detailsList: list);
      return right(singleOrder);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }
}