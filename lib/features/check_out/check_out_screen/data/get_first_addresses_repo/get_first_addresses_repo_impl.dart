import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';

import '../../../../../core/services/localization.dart';
import '../../models/customer_addresses_model/CustomerAddressesModel.dart';
import 'get_first_addresses_repo.dart';

class FirstAddressesRepoImpl implements FirstAddressesRepo{
  @override
  Future<Either<Failure, CustomerAddressesModel>> getFirstAddresses() async{
    try{
      CustomerAddressesModel customerAddressesModel;
      var res = await ApiService.getDataWithToken(endPoint: ApiService.customerFirstAddresses);
      customerAddressesModel = CustomerAddressesModel.fromJson(res);
      return right(customerAddressesModel);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

  @override
  Future<Either<Failure, Map>> deleteAddress({required String addressId}) async{
    try{
      var res = await ApiService.delete(endPoint: '${ApiService.address}/$addressId',);
      return right(res);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

}