import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/data/get_category_products_repo/products_repo.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/models/category_model/Product.dart';

import '../../../../core/services/api_service.dart';
import '../../models/category_model/CategoryModel.dart';
import '../../services/localization.dart';

class ProductsRepoImpl implements ProductsRepo{
  @override
  Future<Either<Failure, CategoryProductsModel>> getCategoryProducts({ String? catId,link}) async{
    try {
      late CategoryProductsModel categoryModel;
      var res = await ApiService.getCategoryProducts(catId: catId,link: link);
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

  Future<Either<Failure, List<Product>>> getFilteredProduct({required String addedLink,}) async{
    try {
      List<Product> list =[];
      var res = await ApiService.getDataWithToken(endPoint: addedLink);
      res['data'].forEach((x){
        list.add(Product.fromJson(x));
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