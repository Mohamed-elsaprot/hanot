import 'package:flutter_secure_storage/flutter_secure_storage.dart';
abstract class SecureStorage{
  static const FlutterSecureStorage storage = FlutterSecureStorage();

  static const String tokenKey='token';


  static Future deleteData()async{
    await storage.delete(key: tokenKey);

  }

  static Future setToken(String x)async{
    await storage.write(key: tokenKey, value: x);
  }

  static Future getToken()async{
    var res = await storage.read(key: tokenKey);
    return res;
  }

}