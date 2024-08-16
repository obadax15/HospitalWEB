import 'dart:convert';

import 'package:hospital/constances/token.dart';
import 'package:http/http.dart' as http;

import '../../constances/strings.dart';

class NurseApi {
  static Future getNurse () async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/nurses"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
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

  static Future searchNurse (String search) async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/nurses/search/$search"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
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

  static Future deleteNurse (int id) async {
    try {
      var response = await http.delete(
        Uri.parse("${Strings.api}/nurses/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token
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

  static Future createNurse(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate ) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/nurses"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
        },
        body: jsonEncode({
          "fullName" : name ,
          "phoneNumber" : number ,
          "fatherName" : father ,
          "motherName" : mother ,
          "internationalNumber" : inNumber ,
          "currentLocation" : location ,
          "gender" : gender == 'Male' ? true : false ,
          "birthdate" : birthdate,

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

  static Future editNurse(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , int id) async {
    try {
      var response = await http.put(
        Uri.parse("${Strings.api}/nurses/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
        },
        body: jsonEncode({
          "fullName" : name ,
          "phoneNumber" : number ,
          "fatherName" : father ,
          "motherName" : mother ,
          "internationalNumber" : inNumber ,
          "currentLocation" : location ,
          "gender" : gender == 'Male' ? true : false ,
          "birthdate" : birthdate,
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
}