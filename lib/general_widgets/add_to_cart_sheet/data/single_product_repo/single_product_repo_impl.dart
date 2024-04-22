import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/general_widgets/add_to_cart_sheet/data/single_product_repo/single_product_repo.dart';

import '../../models/single_product_model/SingleProductModel.dart';

class SingleProductRepoImpl implements SingleProductRepo{
  @override
  Future<Either<Failure, SingleProductModel>> getSingleProductModel({required String id}) async {
    try{
      SingleProductModel singleProductModel;
      var res = await ApiService.getData(endPoint: ApiService.singleProductDetails+id);
      singleProductModel = SingleProductModel.fromJson(res['data']);
      return right(singleProductModel);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

}