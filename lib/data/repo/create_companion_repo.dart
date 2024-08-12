import 'dart:convert';

import 'package:hospital/data/api/create_companion_api.dart';

class CreateCompanionRepo {
  static Future createCompanion(String name , String number ,String inNumber , int id) async {
    try {
      var response = await CreateCompanionApi.createCompanion(name, number,inNumber, id) ;
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future editCompanion(String name , String number ,String inNumber , int id) async {
    try {
      var response = await CreateCompanionApi.editCompanion(name, number,inNumber, id) ;
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future getCompanion(int id) async {
    try {
      var response = await CreateCompanionApi.getCompanion(id) ;
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }
}