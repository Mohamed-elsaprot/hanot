import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/check_out/check_out_screen/data/check_out_repo/check_out_repo.dart';
import 'package:hanot/features/check_out/check_out_screen/models/order_model/OrderModel.dart';

class CheckOutRepoImpl implements CheckOutRepo {
  @override
  Future<Either<Failure, OrderModel>> sendOrder({
    required String paymentMethod,
    required String deliveryMethod,
    required String notes,
    required num? addressId,
    required num? priceId
  }) async {
    try {
      OrderModel orderModel;
      var res = await ApiService.postDataWithToken(
          endPoint: ApiService.checkout,
          postedData: {
            "payment_method": paymentMethod,
            "delivery_method": deliveryMethod,
            if(addressId!=null) "address_id": addressId,
            "price_id": priceId,
            "notes": notes
          });
      orderModel = OrderModel.fromJson(res['data']);
      print(res);
      return right(orderModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }
}