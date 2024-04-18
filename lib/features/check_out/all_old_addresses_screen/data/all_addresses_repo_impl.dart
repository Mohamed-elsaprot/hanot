import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/check_out/all_old_addresses_screen/data/all_addresses_repo.dart';
import 'package:hanot/features/check_out/check_out_screen/models/customer_addresses_model/Addresses.dart';

class AllAddressesRepoImpl implements AllAddressesRepo{
  @override
  Future<Either<Failure, List<Address>>> getAllAddresses() async{
    try{
      List<Address> addressesList=[];
      var res = await ApiService.getDataWithToken(endPoint: ApiService.allAddresses);
      res['data'].forEach((x){
        addressesList.add(Address.fromJson(x));
      });
      return right(addressesList);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

  @override
  Future<Either<Failure, Map>> deleteAddress({required String addressId}) async{
    try{
      var res = await ApiService.delete(endPoint: '${ApiService.address}/$addressId');
      return right(res);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

}