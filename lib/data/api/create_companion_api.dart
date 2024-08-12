import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constances/strings.dart';
import '../../constances/token.dart';

class CreateCompanionApi {
  static Future createCompanion(String name , String number , String inNumber, int id) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/patient/companion/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
        },
        body: jsonEncode({
          "fullName" : name ,
          "phoneNumber" : number ,
          "internationalNumber" : inNumber ,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future editCompanion(String name , String number , String inNumber, int id) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/patient/editCompanionInformation/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
        },
        body: jsonEncode({
          "fullName" : name ,
          "phoneNumber" : number ,
          "internationalNumber" : inNumber ,
        }),
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future getCompanion(int id) async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/patient/companion/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
        },
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