import 'dart:convert';

import 'package:hospital/data/api/schedule_api.dart';

class ScheduleRepo {
  static Future getDoctorSchedule(int id) async {
    try {
      var response = await ScheduleApi.getDoctorSchedule(id);
      return jsonDecode(response)['workingTime'];
    } catch (e) {
      rethrow ;
    }
  }

  static Future getNurseSchedule(int id) async {
    try {
      var response = await ScheduleApi.getNurseSchedule(id);
      return jsonDecode(response)['workingTime'];
    } catch (e) {
      rethrow ;
    }
  }

  static Future getDoctorsSchedule(int id) async {
    try {
      var response = await ScheduleApi.getDoctorsSchedule(id);
      return jsonDecode(response)['times'];
    } catch (e) {
      rethrow ;
    }
  }

  static Future getAllNurseSchedule() async {
    try {
      var response = await ScheduleApi.getAllNurseSchedule();
      return jsonDecode(response)['times'];
    } catch (e) {
      rethrow ;
    }
  }
}