import 'package:dartz/dartz.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/features/check_out/add_new_location/models/Country.dart';

abstract class CountriesRepo{
  Future<Either<Failure,List<Country>>> getCountries();
}