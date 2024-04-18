import 'package:dartz/dartz.dart';
import 'package:hanot/core/errors/failure.dart';

import '../../models/customer_addresses_model/CustomerAddressesModel.dart';

abstract class FirstAddressesRepo {
  Future<Either<Failure,CustomerAddressesModel>> getFirstAddresses();
  Future<Either<Failure,Map>> deleteAddress({required String addressId});
}