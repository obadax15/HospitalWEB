import 'dart:convert';

import 'package:hospital/data/api/nurse_schedule_api.dart';

class NurseScheduleRepo {
  static Future addSchedule(int id , List times) async {
    try {
      var response = await NurseScheduleApi.addNurseSchedule(id, times);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }

  static Future addDoctorSchedule(int id , List times) async {
    try {
      var response = await NurseScheduleApi.addDoctorSchedule(id, times);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }
}