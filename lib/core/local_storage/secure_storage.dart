import 'package:flutter_secure_storage/flutter_secure_storage.dart';
abstract class SecureStorage{
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static const String tokenKey='token';
  static const String userId='userId';
  static const String lang='lang';
  static const String direction='direction';
  static String? local;


  static Future deleteData()async{
    await storage.delete(key: tokenKey);
    await storage.delete(key: userId);
    await storage.delete(key: lang);
    await storage.delete(key: direction);

  }

  static Future setToken(String x)async{
    await storage.write(key: tokenKey, value: x);
  }

  static Future getToken()async{
    var res = await storage.read(key: tokenKey);
    return res;
  }

  static Future setUserId(String x)async{
    await storage.write(key: userId, value: x);
  }

  static Future getUserId()async{
    var res = await storage.read(key: userId);
    return res;
  }

  static Future setUserLang(String x)async{
    await storage.write(key: lang, value: x);
  }

  static Future getUserLang()async{
    var res = await storage.read(key: lang);

    return res;
  }

  static Future setAppDirection(String x)async{
    await storage.write(key: direction, value: x);
  }

  static Future getAppDirection()async{
    var res = await storage.read(key: direction);
    return res;
  }

}