import 'dart:convert';

import 'package:hospital/data/api/room_api.dart';

class RoomRepo {
  static Future getRoom(int id) async {
    try {
      var response = await RoomApi.getAllRoom(id) ;
      return jsonDecode(response)['rooms'] ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future getFloor() async {
    try {
      var response = await RoomApi.getFloor() ;
      return jsonDecode(response)['floors'] ;
    } catch (e) {
      rethrow ;
    }
  }
}