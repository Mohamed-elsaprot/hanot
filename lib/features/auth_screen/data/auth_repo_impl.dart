import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';

import '../../../core/services/api_service.dart';
import '../../../core/services/localization.dart';

class AuthRepoImpl{
  @override
  Future<Either<Failure, Map>> setName({required String name}) async{
    try {
      var res = await ApiService.postDataWithToken(endPoint: ApiService.profile, postedData: {
        "name": name
      });
      // print(res);
      return right(res);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

  Future<Either<Failure, Map>> confirmOtm({required Map data}) async{
    try {
      var res = await ApiService.postData(endPoint: ApiService.confirmOtp, postedData: data);
      return right(res);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
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
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

}