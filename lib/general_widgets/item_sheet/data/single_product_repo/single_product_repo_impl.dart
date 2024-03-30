import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/general_widgets/item_sheet/data/single_product_repo/single_product_repo.dart';
import 'package:hanot/general_widgets/item_sheet/models/single_product_model/SingleProductModel.dart';

import '../../models/single_sku_details/SingleSkuDetails.dart';

class SingleProductRepoImpl implements SingleProductRepo{
  @override
  Future<Either<Failure, SingleProductModel>> getSingleProductModel({required String id}) async {
    try{
      SingleProductModel singleProductModel;
      var res = await ApiService.getDataWithToken(endPoint: ApiService.singleProductDetails+id);
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

  @override
  Future<Either<Failure, SingleSkuDetails>> checkSkuDetails({required Map body}) async{
    try{
      SingleSkuDetails singleSkuDetails;
      var res = await ApiService.postDataWithToken(endPoint: ApiService.singleSkuDetails, postedData: body);
      singleSkuDetails = SingleSkuDetails.fromJson(res['data']);
      return right(singleSkuDetails);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

}