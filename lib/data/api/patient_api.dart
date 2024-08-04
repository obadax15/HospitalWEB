import 'dart:convert';

import 'package:hospital/constances/strings.dart';
import 'package:hospital/constances/token.dart';
import 'package:http/http.dart' as http;

class PatientApi {
  static Future createPatient(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , String work , String social) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/patient"),
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
          "work" : work,
          "socialStatus" : social
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