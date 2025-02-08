import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/check_out/check_out_screen/data/shipping_companies_repo/shipping_companies_repo.dart';
import 'package:hanot/features/check_out/check_out_screen/models/shipping_fees_model/ShippingFeesModel.dart';
import 'package:hanot/features/check_out/check_out_screen/models/shipping_company/ShippingCompany.dart';

import '../../../../../core/services/localization.dart';

class ShippingCompaniesRepoImpl implements ShippingCompaniesRepo{
  @override
  Future<Either<Failure, List<ShippingCompany>>> getShippingCompanies({required num addressId}) async{
    try{
      List<ShippingCompany> list=[];
      var res = await ApiService.postDataWithToken(endPoint: ApiService.shippingCompanies, postedData: {"address_id": addressId});
      res['data'].forEach((e){
        list.add(ShippingCompany.fromJson(e));
      });
      return right(list);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

  @override
  Future<Either<Failure, ShippingFeesModel>> getShippingFees({required num priceId}) async{
    try{
      ShippingFeesModel shippingFeesModel;
      var res = await ApiService.postDataWithToken(endPoint: ApiService.shippingFees, postedData: {"price_id":priceId});
      shippingFeesModel = ShippingFeesModel.fromJson(res);
      return right(shippingFeesModel);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

}