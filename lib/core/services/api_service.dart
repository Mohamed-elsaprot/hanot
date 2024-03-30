import 'package:dio/dio.dart';

class ApiService {
  static const baseUrl = 'https://hanot.co/khan.com/api/v1/mobile';
  static const categories = '/categories/tree';
  static const smallCategories = '/categories?pre_page=10000';
  static const home = '/home-layouts';
  static const sendOtp = '/auth/login';
  static const confirmOtp = '/auth/confirm';
  static const singleProductDetails = '/products/';
  static const singleSkuDetails = '/products/sku';

  static final Dio _dio = Dio(
    BaseOptions(
        headers: {'Content-Type': 'application/json'},
        receiveDataWhenStatusError: true),
  );

  static Future<Map<String, dynamic>> getData({required String endPoint,}) async {
    Response res = await _dio.get(
      baseUrl + endPoint!,
    );
    return res.data;
  }

  static Future getDataWithToken({required String endPoint,}) async {
    Dio dio = Dio(BaseOptions(headers: {'Content-Type': 'application/json', 'Authorization': "Bearer 4|kGHQn4yrlxrDi1wjbYEZU6KPPfMQy5jeMD1bt5qz6db333ad",}, receiveDataWhenStatusError: true),);
    Response res = await dio.get(
      baseUrl + endPoint!,
    );
    return res.data;
  }

  static Future getCategoryProducts({required String catId,}) async {
    Dio dio = Dio(BaseOptions(headers: {'Content-Type': 'application/json', 'Authorization': "Bearer 4|kGHQn4yrlxrDi1wjbYEZU6KPPfMQy5jeMD1bt5qz6db333ad",}, receiveDataWhenStatusError: true),);
    Response res = await dio.get(
      '$baseUrl/categories/$catId?page=1&pre_page=26',
    );
    return res.data;
  }

  static Future getNextPageProducts({required String link}) async {
    Dio dio = Dio(BaseOptions(headers: {'Content-Type': 'application/json', 'Authorization': "Bearer 4|kGHQn4yrlxrDi1wjbYEZU6KPPfMQy5jeMD1bt5qz6db333ad",}, receiveDataWhenStatusError: true),);
    Response res = await dio.get(
      '$link&pre_page=26',
    );
    return res.data;
  }

  static Future postDataWithToken({required String endPoint,required postedData}) async {
    Dio dio = Dio(BaseOptions(headers: {'Content-Type': 'application/json', 'Authorization': "Bearer 4|kGHQn4yrlxrDi1wjbYEZU6KPPfMQy5jeMD1bt5qz6db333ad",}, receiveDataWhenStatusError: true),);
    Response res = await dio.post(baseUrl+endPoint,data: postedData);
    return res.data;
  }

  static Future postData({required String endPoint,required postedData}) async {
    Dio dio = Dio(BaseOptions(headers: {'Content-Type': 'application/json',}, receiveDataWhenStatusError: true),);
    Response res = await dio.post(baseUrl+endPoint,data: postedData);
    return res.data;
  }

}
