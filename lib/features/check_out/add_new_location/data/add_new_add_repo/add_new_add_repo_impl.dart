import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/check_out/add_new_location/data/add_new_add_repo/add_new_add_repo.dart';
import 'package:hanot/features/check_out/check_out_screen/models/customer_addresses_model/Addresses.dart';

class AddNewAddressRepoImpl implements AddNewAddressRepo{
  @override
  Future<Either<Failure, Address>> addNewAddress({required Map body}) async{
    try{
      Address address;
      var res = await ApiService.postDataWithToken(endPoint: ApiService.address, postedData: body);
      address = Address.fromJson(res['data']);
      return right(address);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

}