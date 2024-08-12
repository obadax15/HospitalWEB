import 'dart:convert';

import 'package:hospital/data/api/doctor_api.dart';

class DoctorRepo {
  static Future getDoctor() async {
    try {
      var response = await DoctorApi.getDoctor();
      return jsonDecode(response)['doctors'];
    } catch (e) {
      rethrow ;
    }
  }

  static Future getSp() async {
    try {
      var response = await DoctorApi.getSpe();
      return jsonDecode(response)['specialists'];
    } catch (e) {
      rethrow ;
    }
  }

  static Future getFloorDoctor(int id) async {
    try {
      var response = await DoctorApi.getFloorDoctor(id);
      return jsonDecode(response)['doctors'];
    } catch (e) {
      rethrow ;
    }
  }

  static Future getSpDoctor(int id) async {
    try {
      var response = await DoctorApi.getSpDoctor(id);
      return jsonDecode(response)['doctors'];
    } catch (e) {
      rethrow ;
    }
  }
}