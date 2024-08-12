import 'package:http/http.dart' as http ;

import '../../constances/strings.dart';

class DoctorApi {
  static Future getDoctor () async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/doctors"),
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

  static Future getFloorDoctor (int id) async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/doctors/floor/$id"),
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

  static Future getSpDoctor (int id) async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/doctors/$id"),
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

  static Future getSpe () async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/specialists"),
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