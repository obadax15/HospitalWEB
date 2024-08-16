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

  static Future searchNon(int id ,String search) async {
    try {
      var response = await ReceptionApi.searchNon(id,search) ;
      return jsonDecode(response)["nonMedical"] ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future deleteReception(int id) async {
    try {
      var response = await ReceptionApi.deleteReception(id);
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future getReceptionDetails(int id) async {
    try {
      var response = await ReceptionApi.getReceptionDetails(id);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }
  static Future edit_Reception(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , int id) async {
    try {
      var response = await ReceptionApi.edit_Reception(name, number, father, mother, inNumber, location, gender, birthdate, id);
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }
}