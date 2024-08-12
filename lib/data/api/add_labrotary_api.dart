import 'dart:convert';

import 'package:hospital/constances/strings.dart';
import 'package:hospital/constances/token.dart';
import 'package:http/http.dart' as http;

class Add_Labrotary_Api {
  static Future createLabEmp(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , ) async {
    try {
      print('jkjkj') ;
      var response = await http.post(
        Uri.parse("${Strings.api}/nonMedicals/1"),
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
}