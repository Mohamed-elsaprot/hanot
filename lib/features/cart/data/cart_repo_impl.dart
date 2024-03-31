import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/cart/data/cart_repo.dart';
import 'package:hanot/features/cart/models/CartProductModel.dart';

import '../../../general_widgets/add_to_cart_sheet/models/single_sku_details/SingleSkuDetails.dart';

class CartRepoImpl implements CartRepo{
  @override
  Future<Either<Failure, Map>> addToCart({required Map body}) async{
    try{
      var res = await ApiService.postDataWithToken(endPoint: ApiService.shoppingCart, postedData: body);
      if(res['data']==null){
        throw 'المنتج مضافة و الكمية غير متوفرة حالياٌ .';
      }
      return right(res['data']);
    }catch(e){
      if(e is DioException){
        return left(ServerFailure.fromDioError(e));
      }else if(e == 'المنتج مضافة و الكمية غير متوفرة حالياٌ .') {
        return left(ServerFailure('المنتج مضافة و الكمية غير متوفرة حالياٌ .'));
      }else{
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

  @override
  Future<Either<Failure, List<CartProductModel>>> getCartProducts() async{
    try{
      List<CartProductModel> list=[];
      var res = await ApiService.getDataWithToken(endPoint: ApiService.shoppingCart);
      res['data'].forEach((e){
        list.add(CartProductModel.fromJson(e));
      });
      return right(list);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }



}