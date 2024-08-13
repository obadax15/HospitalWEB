import 'dart:convert';

import 'package:hospital/data/api/make_examination_read_api.dart';

class Make_Examination_Read_Repo {
  static Future makeExaminationRead(int id) async {
    try {
      var response = await Make_Examination_Read_Api.makeExaminationRead(id);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
