import 'package:dartz/dartz.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/features/check_out/check_out_screen/models/payment_method_model/PaymentMethodModel.dart';

abstract class PaymentMethodRepo{
  Future<Either<Failure,List<PaymentMethodModel>>> getPaymentMethods();
}