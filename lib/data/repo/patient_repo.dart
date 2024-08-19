import 'dart:convert';

import 'package:hospital/data/api/patient_api.dart';

class PatientRepo {
  static Future createPatient(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , String work , String social) async {
    try {
      var response = await PatientApi.createPatient(name, number, father , mother , inNumber , location , gender , birthdate,work , social) ;
      return jsonDecode(response)['id'][0];
    } catch (e) {
      rethrow ;
    }
  }

  static Future getPatientByRoom(int roomID) async {
    try {
      var response = await PatientApi.getPatientByRoom(roomID) ;
      return jsonDecode(response)['patient'] ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future downloadPdf(int id) async {
    try {
      var response = await PatientApi.downloadPdf(id) ;
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future statistics() async {
    try {
      var response = await PatientApi.statistics() ;
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future edit(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , String work , String social , int id) async {
    try {
      var response = await PatientApi.edit(name, number, father , mother , inNumber , location , gender , birthdate,work , social , id) ;
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }
}