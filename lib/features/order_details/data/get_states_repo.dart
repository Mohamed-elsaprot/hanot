import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/features/order_details/models/StateModel.dart';

import '../../../core/errors/failure.dart';
import '../../../core/services/api_service.dart';
import '../../../core/services/localization.dart';

class GetStatesRepo{
  Future<Either<Failure, List<StateModel>>> getStates({required int orderId}) async {
    try {
      List<StateModel> list=[];
      var response = await ApiService.getDataWithToken(endPoint: ApiService.states,);
      response.forEach((x){
        list.add(StateModel.fromJson(x));
      });
      return right(list);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }
}