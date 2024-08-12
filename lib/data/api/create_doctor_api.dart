import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constances/strings.dart';
import '../../constances/token.dart';

class CreateDoctorApi {
  static Future createDoctor(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , int id) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/doctors/$id"),
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

  static Future editDoctor(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , int id) async {
    try {
      var response = await http.put(
        Uri.parse("${Strings.api}/doctors/$id"),
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


  static Future deleteDoctor(int id) async {
    try {
      var response = await http.delete(
        Uri.parse("${Strings.api}/doctors/$id"),
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