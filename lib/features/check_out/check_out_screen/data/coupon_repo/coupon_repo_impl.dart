import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/check_out/check_out_screen/data/coupon_repo/coupon_repo.dart';

class CouponRepoImpl implements CouponRepo{
  @override
  Future<Either<Failure, Map>> applyCoupon({required String coupon}) async{
    try{
      var res = await ApiService.postDataWithToken(endPoint: ApiService.applyCoupon, postedData: {'coupon':coupon});
      if(res['status']=='success'){
        return right(res);
      }else{
        return left(ServerFailure(res['message']));
      }
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
    }
  }