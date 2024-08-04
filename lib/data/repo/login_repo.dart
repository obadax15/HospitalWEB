import 'dart:convert';

import 'package:hospital/data/api/login_api.dart';

class LoginRepo {
  static Future login(String password , int sp , String type) async {
    try {
      var response = await LoginApi.login(password, sp, type) ;
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }
}