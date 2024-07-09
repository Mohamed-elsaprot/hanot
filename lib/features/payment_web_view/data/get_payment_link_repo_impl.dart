import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/features/payment_web_view/data/get_payment_link_repo.dart';

import '../../../core/services/api_service.dart';

class GetPaymentLinkRepoImpl implements GetPaymentLinkRepo{
  @override
  Future<Either<Failure, String>> getPaymentLink({required int orderId})async{
    try{
      var res = await ApiService.postDataWithToken(endPoint: ApiService.payment,postedData: {"order_id": orderId});
      String link='';
      if(res['data']['payment_link']!=null){
        link=res['data']['payment_link'];
      }
      return right(link);
    }catch(e){
      if(e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }else{
        return left(ServerFailure(e.toString()));
      }
    }
  }
}