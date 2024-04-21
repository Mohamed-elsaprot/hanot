import 'package:dartz/dartz.dart';
import 'package:hanot/features/check_out/check_out_screen/models/shipping_fees_model/ShippingFeesModel.dart';
import 'package:hanot/features/check_out/check_out_screen/models/shipping_company/ShippingCompany.dart';

import '../../../../../core/errors/failure.dart';

abstract class ShippingCompaniesRepo{
  Future<Either<Failure,List<ShippingCompany>>> getShippingCompanies({required num addressId});
  Future<Either<Failure,ShippingFeesModel>> getShippingFees({required num priceId});
}