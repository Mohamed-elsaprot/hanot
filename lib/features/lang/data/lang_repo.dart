import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:hanot/core/services/api_service.dart';
import 'package:hanot/features/lang/model/LangModel.dart';

import '../../../core/errors/failure.dart';

class LangRepo {
  Future<Either<Failure, Map>> getTexts() async {
    try {
      Map resMap = await ApiService.getDataWithToken(endPoint: ApiService.translations);
      return right(resMap);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

  Future<Either<Failure, List<LangModel>>> getLanguages() async {
    try {
      var res = await ApiService.getDataWithToken(endPoint: ApiService.languages);
      List<LangModel> list=[];
      res['data'].forEach((x)=>list.add(LangModel.fromJson(x)));
      return right(list);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

  Future<Either<Failure, LangModel>> getDefaultUserLang() async {
    try {
      var res = await ApiService.getDataWithToken(endPoint: ApiService.defaultLang);
      LangModel defaultLang;
      defaultLang=LangModel.fromJson(res['data']);
      return right(defaultLang);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      } else {
        return left(ServerFailure('حدث خطأ من فضلك حاول لاحقا'));
      }
    }
  }

  Future<Either<Failure, dynamic>> setUserDefaultLang({required int langId}) async {
    try {
      var res = await ApiService.postDataWithToken(endPoint: ApiService.defaultLang,postedData: {"language_id": langId});
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
