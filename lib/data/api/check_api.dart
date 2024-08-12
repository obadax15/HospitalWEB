import 'package:http/http.dart' as http;

import '../../constances/strings.dart';
import '../../constances/token.dart';

class CheckApi {
  static Future checkIn(int id , int patientId) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/patient/chooseRoom/$id/$patientId"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
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

  static Future checkOut(int id) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/patient/checkout/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
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

  static Future restorePatient(int id) async {
    try {
      var response = await http.post(
        Uri.parse("${Strings.api}/patient/restorePatient/$id"),
        headers: {
          "Accept": "application/json",
          'Content-Type': 'application/json',
          'token' : Token.token ,
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