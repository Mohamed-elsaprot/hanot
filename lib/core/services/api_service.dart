import 'dart:math';

import 'package:dio/dio.dart';
import 'package:hanot/core/local_storage/secure_storage.dart';

class ApiService {
  static const baseUrl = 'https://dev.hanot.co/khan.com/api/v1/mobile';
  // static const baseUrl = 'https://hanot.co/khan.com/api/v1/mobile';
  static const categories = '/categories/tree';
  static const smallCategories = '/categories?pre_page=10000';
  static const home = '/home-layouts';
  static const sendOtp = '/auth/login';
  static const confirmOtp = '/auth/confirm';
  static const singleProductDetails = '/products/';
  static const singleSkuDetails = '/products/sku';
  static const shoppingCart = '/shoppingCart';
  static const customerFirstAddresses = '/addresses?pre_page=2&page=1';
  static const allAddresses = '/addresses/all';
  static const countries = '/addresses/countries';
  static const cities = '/addresses/cities?country_id=';
  static const address = '/addresses';
  static const shippingCompanies = '/shipping-companies/by-address';
  static const shippingFees = '/shipping-companies/shipping-company-fees';
  static const paymentMethods = '/payment-methods';
  static const applyCoupon = '/coupon';
  static const checkout = '/checkout';
  static const payment = '/payment';
  static const currentOrders = '/orders/current';
  static const prevOrders = '/orders';
  static const favorites = '/favorites';
  static const search = '/search?key=';
  static const states = '/orders/status';
  static const translations = '/translations';
  static const languages = '/languages';
  static const defaultLang = '/languages/default';

  static final Dio _dio = Dio(
    BaseOptions(
        headers: {'Content-Type': 'application/json'},
        receiveDataWhenStatusError: true),
  );

  static Future<Map<String, dynamic>> getData({
    required String endPoint,
  }) async {
    String? userId = await SecureStorage.getUserId();
    if(userId!=null){
      _dio.options.headers['user-id'] = int.parse(userId);
    }
    String? lang = await SecureStorage.getUserLang();
    if(lang!=null){
      _dio.options.headers['locale'] = lang;
    }
    Response res = await _dio.get(
      baseUrl + endPoint,
    );
    return res.data;
  }

  static Future postData(
      {required String endPoint, required postedData}) async {
    String? lang = await SecureStorage.getUserLang();
    if(lang!=null){
      _dio.options.headers['locale'] = lang;
    }
    Response res = await _dio.post(baseUrl + endPoint, data: postedData);
    return res.data;
  }

  static Future getDataWithToken(
      {required String endPoint, String? perPage}) async {
    String? token = await SecureStorage.getToken();
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    String? userId = await SecureStorage.getUserId();
    if(userId!=null){
      _dio.options.headers['user-id'] = int.parse(userId);
    }
    String? lang = await SecureStorage.getUserLang();
    if(lang!=null){
      _dio.options.headers['locale'] = lang;
    }
    Response res = await _dio.get(
      perPage == null ? baseUrl + endPoint : '$baseUrl$endPoint?page=1&pre_page=$perPage',
    );
    return res.data;
  }

  static Future postDataWithToken(
      {required String endPoint, required postedData}) async {
    String? token = await SecureStorage.getToken();
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    String? userId = await SecureStorage.getUserId();
    if(userId!=null){
      _dio.options.headers['user-id'] = int.parse(userId);
    }
    String? lang = await SecureStorage.getUserLang();
    if(lang!=null){
      _dio.options.headers['locale'] = lang;
    }
    Response res = await _dio.post(baseUrl + endPoint, data: postedData);
    return res.data;
  }

  static Future delete({required String endPoint}) async {
    String? token = await SecureStorage.getToken();
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    Response res = await _dio.delete(baseUrl + endPoint);
    return res.data;
  }

  static Future update({required String endPoint, required Map body}) async {
    String? token = await SecureStorage.getToken();
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    Response res = await _dio.put(baseUrl + endPoint, data: body);
    return res.data;
  }

  static Future getCategoryProducts({required String catId,}) async {
    String? token = await SecureStorage.getToken();
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    String? userId = await SecureStorage.getUserId();
    if(userId!=null){
      _dio.options.headers['user-id'] = int.parse(userId);
    }
    String? lang = await SecureStorage.getUserLang();
    if(lang!=null){
      _dio.options.headers['locale'] = lang;
    }
    Response res = await _dio.get(
      '$baseUrl/categories/$catId?page=1&pre_page=26',
    );
    return res.data;
  }

  static Future getNextPage({required String link, required String perPage}) async {
    String? token = await SecureStorage.getToken();
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    String? userId = await SecureStorage.getUserId();
    if(userId!=null){
      _dio.options.headers['user-id'] = int.parse(userId);
    }
    String? lang = await SecureStorage.getUserLang();
    if(lang!=null){
      _dio.options.headers['locale'] = lang;
    }
    Response res = await _dio.get(
      '$link&pre_page=$perPage',
    );
    return res.data;
  }

}