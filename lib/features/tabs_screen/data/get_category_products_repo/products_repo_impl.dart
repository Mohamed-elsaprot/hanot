import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/features/tabs_screen/data/get_category_products_repo/products_repo.dart';

import '../../../../core/services/api_service.dart';
import '../../model/category_model/CategoryModel.dart';

class ProductsRepoImpl implements ProductsRepo{
  @override
  Future<Either<Failure, CategoryProductsModel>> getCategoryProducts({required String catId,}) async{
    try {
      late CategoryProductsModel categoryModel;
      var res = await ApiService.getCategoryProducts(catId: catId);
      categoryModel = CategoryProductsModel.fromJson(res);
      return right(categoryModel);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }
}