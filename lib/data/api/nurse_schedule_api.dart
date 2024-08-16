import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../constances/strings.dart';

class NurseScheduleApi {
  static Future addNurseSchedule (int id , List times) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/nurseWorking/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'workingTime' : times
        }) ,
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future addDoctorSchedule (int id , List times) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/working/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
        },
        body: json.encode({
          'workingTime' : times
        }) ,
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }
}