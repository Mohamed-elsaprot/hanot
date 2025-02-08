import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/errors/failure.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/home/data/home_data_repo.dart';
import 'package:hanot/features/home/models/HomeModelWithBannerItems/HomeModelWithBannerItems.dart';
import 'package:hanot/features/home/models/HomeModelWithCategores/HomeModelWithCategories.dart';
import 'package:hanot/features/home/models/HomeModelWithProducts/HomeModelWithProducts.dart';

import '../../../core/services/localization.dart';

class HomeDataRepoImpl implements HomeDataRepo{
  @override
  Future<Either<Failure, List>> getHomeData() async{
    try{
      List homeList =[];
      var res = await ApiService.getData(endPoint: ApiService.home);
      res['data'].forEach((item){
        if(item['type']=='slide_products'){
          homeList.add(HomeModelWithProducts.fromJson(item));
        }else if(item['type']=='banner'){
          homeList.add(HomeModelWithBannerItems.fromJson(item));
        }else if(item['type']=='categories'){
          if(item['template']==1){
            homeList.add(HomeModelWithCategories.fromJson(item));
          }else{
            homeList.add(HomeModelWithCategories.fromJson(item));
          }
        }
      });
      return right(homeList);
    }catch(e){
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure(Localization.tryAgainMessage));
      }
    }
  }

}