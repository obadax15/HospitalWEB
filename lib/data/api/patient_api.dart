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

  static Future getPatientByRoom (int roomID) async {
    try {
      var response=await http.get(
          Uri.parse("${Strings.api}/patient/getPatientByRoom/$roomID"),
          headers: {
            'Content-Type': 'application/json',
          }
      );
      if(response.statusCode==200){
        return response.body;
      }
    } catch (e) {
      rethrow ;
    }
  }

  static Future downloadPdf (int id) async {
    try {
      var response=await http.get(
          Uri.parse("${Strings.api}/file_pdf/$id"),
          headers: {
            'Content-Type': 'application/json',
          }
      );
      print(response.body) ;
      if(response.statusCode == 200){
        print(response.body) ;
        return response.body;
      }
    } catch (e) {
      rethrow ;
    }
  }

  static Future statistics () async {
    try {
      var response=await http.get(
          Uri.parse("${Strings.api}/doctors/statistics/patient"),
          headers: {
            'Content-Type': 'application/json',
          }
      );
      print(response.body) ;
      if(response.statusCode==200){
        return response.body;
      }
    } catch (e) {
      rethrow ;
    }
  }

  static Future edit(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , String work , String social , int id) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/patient/editPatientInformation/$id"),
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