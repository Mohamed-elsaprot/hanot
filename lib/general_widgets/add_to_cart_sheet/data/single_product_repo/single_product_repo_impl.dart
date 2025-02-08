import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/models/category_model/Product.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/data/single_product_repo/single_product_repo.dart';

import '../../../../core/services/localization.dart';
import '../../models/single_product_model/SingleProductModel.dart';

class SingleProductRepoImpl implements SingleProductRepo{
  @override
  Future<Either<Failure, SingleProductModel>> getSingleProductModel({required String id}) async {
    try{
      SingleProductModel singleProductModel;
      List<Product> related=[];
      var res = await ApiService.getData(endPoint: ApiService.singleProductDetails+id);
      singleProductModel = SingleProductModel.fromJson(res['data']);
      res['related_products'].forEach((x){
        related.add(Product.fromJson(x));
      });
      singleProductModel.relatedProducts=related;
      return right(singleProductModel);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

}