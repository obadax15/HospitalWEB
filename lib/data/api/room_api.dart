import 'dart:convert';

import 'package:hospital/constances/strings.dart';
import 'package:http/http.dart' as http;

class RoomApi {
  static Future getAllRoom(int id) async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/nonSpecialists/rooms/$id") ,
        headers: {
          "Content-Type" : "application/json" ,
        } ,
      ) ;
      if (response.statusCode == 200) {
        return response.body ;
      }
    } catch (e) {
      rethrow ;
    }
  }

  static Future getFloor() async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/nonSpecialists/floors") ,
        headers: {
          "Content-Type" : "application/json" ,
        } ,
      ) ;
      if (response.statusCode == 200) {
        return response.body ;
      }
    } catch (e) {
      rethrow ;
    }
  }
}