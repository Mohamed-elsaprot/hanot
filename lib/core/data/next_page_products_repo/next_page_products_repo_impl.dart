import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';

import '../../../../core/services/api_service.dart';
import '../../models/category_model/CategoryModel.dart';
import '../../services/localization.dart';
import 'next_page_products_repo.dart';

class NextPageProductsRepoImpl implements NextPageProductsRepo{
  @override
  Future<Either<Failure, CategoryProductsModel>> getNextPageProducts({required String nextLink,}) async{
    try {
      late CategoryProductsModel categoryModel;
      var res = await ApiService.getNextPage(link: nextLink,perPage: '26');
      categoryModel = CategoryProductsModel.fromJson(res);
      return right(categoryModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }
}