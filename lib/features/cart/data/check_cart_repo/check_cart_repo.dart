import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/core/services/localization.dart';

class CheckCartRepo {
  Future<Either<Failure, bool>> checkCart() async {
    try {
      bool check = false;
      var res =
          await ApiService.getDataWithToken(endPoint: ApiService.checkCart);
      check = res['status'];
      return right(check);
    } catch (e) {
        if (e is DioException) {
          return left(ServerFailure.fromDioError(e));
        } else {
          return left(ServerFailure(Localization.tryAgainMessage));
        }
      }
    }
}
