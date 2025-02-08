import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';

import '../../../../core/services/localization.dart';
import '../../model/SmallCategoryModel.dart';

class SmallCategoryRepoImpl {
  @override
  Future<Either<Failure, List<SmallCategoryModel>>> getSmallCategories() async{
    try {
      List<SmallCategoryModel> list =[];
      var res = await ApiService.getData(endPoint: ApiService.smallCategories);
      res['data'].forEach((val){
        list.add(SmallCategoryModel.fromJson(val));
      });
      return right(list);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }


}