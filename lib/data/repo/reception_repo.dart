import 'dart:convert';

import 'package:hospital/data/api/patient_api.dart';
import 'package:hospital/data/api/reception_api.dart';

class ReceptionRepo {
  static Future createReception(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate ) async {
    try {
      var response = await ReceptionApi.createReception(name, number, father , mother , inNumber , location , gender , birthdate) ;
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }

  static Future getReception() async {
    try {
      var response = await ReceptionApi.getReception() ;
      return jsonDecode(response)["nonMedicals"] ;
    } catch (e) {
      rethrow ;
    }
  }
}