import 'package:dartz/dartz.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/features/check_out/add_new_location/models/City.dart';

abstract class CitiesRepo{
  Future<Either<Failure,List<City>>> getCities({required String countryId});
}