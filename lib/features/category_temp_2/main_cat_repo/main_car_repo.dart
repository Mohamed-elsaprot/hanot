import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/models/category_model/Product.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/categories/model/SmallCategoryModel.dart';

import '../../../core/services/localization.dart';

class CatTemp2Repo {
  Future<Either<Failure,Map>> getCategoryDetails({required String catId})async{
    try{
      Map map={};
      var res = await ApiService.getDataWithToken(endPoint: ApiService.catTemp2+catId);
      map['type']=res['type'];
      map['list']= res['type']=='categories'?
      List.generate(res['data'].length, (index)=> SmallCategoryModel.fromJson(res['data'][index])):
      List.generate(res['data'].length, (index)=> Product.fromJson(res['data'][index]));
      return right(map);
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }else{
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }
}