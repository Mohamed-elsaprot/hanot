import 'package:dartz/dartz.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/features/check_out/check_out_screen/models/order_model/OrderModel.dart';

abstract class CheckOutRepo{
  Future<Either<Failure,OrderModel>> sendOrder({
    required String paymentMethod,
    required String deliveryMethod,
    required String notes,
    required num? addressId,
    required num? priceId,
});
}