import 'package:dartz/dartz.dart';
import 'package:hanot/core/errors/failure.dart';

abstract class CouponRepo{
  Future<Either<Failure,Map>> applyCoupon({required String coupon});
}