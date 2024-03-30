import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';

import '../../../../core/services/api_service.dart';
import '../../model/category_details/CategoryDetails.dart';
import 'category_repo.dart';

class CategoryDetailsRepoImpl implements CategoryDetailsRepo{
  @override
  Future<Either<Failure, List<CategoryDetails>>> getCategories() async{
    try {
      List<CategoryDetails> categoriesList = [];
      var categoriesRes = await ApiService.getDataWithToken(endPoint: ApiService.categories);
      categoriesRes['data'].forEach((val) {
        categoriesList.add(CategoryDetails.fromJson(val));
      });
      return right(categoriesList);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

}