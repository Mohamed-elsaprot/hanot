import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/check_out/check_out_screen/data/payment_method_repo/payment_method_repo.dart';
import 'package:hanot/features/check_out/check_out_screen/models/payment_method_model/PaymentMethodModel.dart';

import '../../../../../core/services/localization.dart';

class PaymentMethodRepoImpl implements PaymentMethodRepo{
  @override
  Future<Either<Failure, List<PaymentMethodModel>>> getPaymentMethods() async{
    try{
      List<PaymentMethodModel> list=[];
      var res = await ApiService.getDataWithToken(endPoint: ApiService.paymentMethods);
      res['data'].forEach((e){
        list.add(PaymentMethodModel.fromJson(e));
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
  }