import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:hospital/data/api/radiograph_api.dart';

class RadiographRepo {
  static Future getRadiograph () async {
    try {
      var response = await RadiographApi.getRadiograph() ;
      return jsonDecode(response)['Radiographs'] ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future getRadiographNotification () async {
    try {
      var response = await RadiographApi.getRadiographNotification() ;
      return jsonDecode(response)['notification'] ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future makeNotRead (int id) async {
    try {
      var response = await RadiographApi.readNot(id) ;
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future addResponse (int id , PlatformFile image , PlatformFile pdf) async {
    try {
      var response = await RadiographApi.addResponse(id, image, pdf) ;
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }
}