import 'package:dartz/dartz.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/features/check_out/check_out_screen/models/customer_addresses_model/Addresses.dart';

abstract class AddNewAddressRepo{
  Future<Either<Failure,Address>> addNewAddress({required Map body});
}