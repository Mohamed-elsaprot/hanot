import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';

import '../../../../core/services/localization.dart';
import '../../model/filter_model/FilterOption.dart';

class FilterRepo {
  Future<Either<Failure,List<FilterOption>>> getFilerOptions({required String catId})async{
    try{
      List<FilterOption> list=[];
      var res = await ApiService.getDataWithToken(endPoint: ApiService.filterOptions+catId);
      res['data'].forEach((x)=>list.add(FilterOption.fromJson(x)));
      // print(res['data']);
      return right(list);
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }else{
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }
}