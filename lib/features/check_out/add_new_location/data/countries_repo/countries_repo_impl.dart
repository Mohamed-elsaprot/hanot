import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/check_out/add_new_location/models/Country.dart';

import 'countries_repo.dart';

class CountriesRepoImpl implements CountriesRepo{
  @override
  Future<Either<Failure, List<Country>>> getCountries() async{
    try{
      List<Country> citiesList=[];
      var res = await ApiService.getDataWithToken(endPoint: ApiService.countries);
      res['data'].forEach((e){
        citiesList.add(Country.fromJson(e));
      });
      return right(citiesList);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

}