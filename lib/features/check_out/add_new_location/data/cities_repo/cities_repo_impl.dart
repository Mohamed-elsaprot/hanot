import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/check_out/add_new_location/data/cities_repo/cities_repo.dart';
import 'package:hanot/features/check_out/add_new_location/models/City.dart';

import '../../../../../core/services/localization.dart';

class CitiesRepoImpl implements CitiesRepo{
  @override
  Future<Either<Failure, List<City>>> getCities({required countryId}) async{
    try{
      List<City> citiesList=[];
      var res = await ApiService.getDataWithToken(endPoint: ApiService.cities+countryId);
      res['data'].forEach((e){
        citiesList.add(City.fromJson(e));
      });
      return right(citiesList);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

}