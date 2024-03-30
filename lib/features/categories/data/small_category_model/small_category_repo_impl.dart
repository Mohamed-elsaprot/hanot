import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/categories/data/small_category_model/small_category_repo.dart';

import '../../model/SmallCategoryModel.dart';

class SmallCategoryRepoImpl implements SmallCategoryRepo{
  @override
  Future<Either<Failure, List<SmallCategoryModel>>> getSmallCategories() async{
    try {
      List<SmallCategoryModel> list =[];
      var res = await ApiService.getDataWithToken(endPoint: ApiService.smallCategories);
      res['data'].forEach((val){
        list.add(SmallCategoryModel.fromJson(val));
      });
      return right(list);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }


}