import 'dart:convert';

import 'package:hospital/data/api/nurse_api.dart';

class NurseRepo {
  static Future getNurse() async {
    try {
      var response = await NurseApi.getNurse();
      return jsonDecode(response)['nurses'];
    } catch (e) {
      rethrow ;
    }
  }

  static Future searchNurse(String search) async {
    try {
      var response = await NurseApi.searchNurse(search);
      return jsonDecode(response)['nurses'];
    } catch (e) {
      rethrow ;
    }
  }

  static Future deleteNurse(int id) async {
    try {
      var response = await NurseApi.deleteNurse(id);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }

  static Future createNurse(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate ) async {
    try {
      var response = await NurseApi.createNurse(name, number, father, mother, inNumber, location, gender, birthdate);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }

  static Future editNurse(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , int id) async {
    try {
      var response = await NurseApi.editNurse(name, number, father, mother, inNumber, location, gender, birthdate , id);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }
}