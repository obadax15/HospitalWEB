import 'package:http/http.dart' as http;

import '../../constances/strings.dart';

class ScheduleApi {
  static Future getDoctorSchedule (int id) async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/working/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future getNurseSchedule (int id) async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/nurseWorking/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future getDoctorsSchedule (int id) async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/working/time/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }

  static Future getAllNurseSchedule () async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/nurseWorking"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
        },
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