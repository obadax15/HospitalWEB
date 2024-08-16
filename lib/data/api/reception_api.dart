import 'dart:convert';

import 'package:hospital/constances/strings.dart';
import 'package:hospital/constances/token.dart';
import 'package:http/http.dart' as http;

class ReceptionApi{
  static Future createReception(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate ) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/nonMedicals/3"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          "token" : Token.token
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

  static Future getReception( ) async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/nonMedicals/3"),
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

  static Future searchNon(int id ,String search) async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/nonMedicals/search/$id/$search"),
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

  static Future deleteReception(int id) async {
    try {
      var response = await http.delete(
        Uri.parse("${Strings.api}/nonMedicals/$id"),
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

  static Future getReceptionDetails (int id) async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/nonMedicals/details/$id"),
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
  static Future edit_Reception(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , int id) async {
    try {
      var response = await http.put(
        Uri.parse("${Strings.api}/nonMedicals/$id"),
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