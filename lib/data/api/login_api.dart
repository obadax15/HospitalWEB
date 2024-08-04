import 'dart:convert';

import 'package:hospital/constances/strings.dart';
import 'package:http/http.dart' as http;

class LoginApi {
  static Future login(String password , int sp , String type) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/login"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
        },
        body: jsonEncode({"password": password, "type": type, "specialist": sp}),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }
}
