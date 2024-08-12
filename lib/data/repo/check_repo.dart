import 'dart:convert';

import 'package:hospital/data/api/check_api.dart';

class CheckRepo {
  static Future getDoctorDetails(int id , int patientId) async {
    try {
      var response = await CheckApi.checkIn(id , patientId);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }

  static Future checkOut(int id ) async {
    try {
      var response = await CheckApi.checkOut(id);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }

  static Future restorePatient(int id ) async {
    try {
      var response = await CheckApi.restorePatient(id);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }
}