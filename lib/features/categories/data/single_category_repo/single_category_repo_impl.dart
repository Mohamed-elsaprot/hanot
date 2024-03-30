import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/features/categories/data/single_category_repo/single_category_repo.dart';
import 'package:hanot/features/tabs_screen/model/category_details/CategoryDetails.dart';

import '../../../../core/services/api_service.dart';

class SingleCategoryRepoImpl implements SingleCategoryRepo{
  @override
  Future<Either<Failure, CategoryDetails>> getSingleCategory({required String catId}) async{
    try {
      late CategoryDetails categoryDetails;
      var categoriesRes = await ApiService.getDataWithToken(endPoint: '${ApiService.categories}/$catId');
      categoryDetails = CategoryDetails.fromJson(categoriesRes['data']);
      return right(categoryDetails);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

}