import 'dart:convert';

import 'package:hospital/data/api/patient_api.dart';

class PatientRepo {
  static Future createPatient(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , String work , String social) async {
    try {
      var response = await PatientApi.createPatient(name, number, father , mother , inNumber , location , gender , birthdate,work , social) ;
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }
}