import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/features/auth_screen/data/auth_repo.dart';

import '../../../core/services/api_service.dart';

class AuthRepoImpl implements AuthRepo{
  @override
  Future<Either<Failure, Map>> confirmOtm() async{
    try {
      var res = await ApiService.postData(endPoint: ApiService.confirmOtp, postedData: {});
      return right(res);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

  @override
  Future<Either<Failure, Map>> sendOtp({required Map data}) async{
    try {
      var res = await ApiService.postData(endPoint: ApiService.sendOtp, postedData: data);
      return right(res);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

}