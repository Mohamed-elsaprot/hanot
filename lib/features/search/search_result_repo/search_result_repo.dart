import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/models/category_model/Product.dart';

import '../../../core/errors/failure.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/localization.dart';

class SearchResultRepo {
  Future<Either<Failure, List<Product>>> getSearchResults({required String keyWord}) async {
    try {
      var response = await ApiService.getDataWithToken(endPoint: ApiService.search+keyWord,);
      List<Product> list=[];
      response['data'].forEach((x)=>list.add(Product.fromJson(x)));
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