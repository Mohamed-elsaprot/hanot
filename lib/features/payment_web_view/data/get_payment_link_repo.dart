import 'package:dartz/dartz.dart';

import '../../../core/errors/failure.dart';

abstract class GetPaymentLinkRepo{
  Future<Either<Failure,String>> getPaymentLink({required int orderId});
}