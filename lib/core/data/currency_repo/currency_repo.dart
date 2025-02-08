import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/services/api_service.dart';

import '../../errors/failure.dart';
import '../../models/Currency.dart';
import '../../services/localization.dart';

class CurrencyRepo {

  Future<Either<Failure,Currency>> getDefaultCurrency()async{
    try{
      var res = await ApiService.getDataWithToken(endPoint: ApiService.defaultCurrency);
      return right(Currency.fromJson(res['data']));
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }else{
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }
}