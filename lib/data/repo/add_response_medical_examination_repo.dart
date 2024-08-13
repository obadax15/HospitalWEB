import 'dart:convert';

import 'package:hospital/data/api/add_response_medical_examination_api.dart';

class Add_Response_Medical_Examination_Repo {
  static Future AddResponseMedicalExamination(String responseexam , int id) async {
    try {
      var response = await Add_Response_Medical_Examination.AddResponseMedicalExamination(responseexam , id);
      return jsonDecode(response);
    } catch (e) {
      rethrow;
    }
  }
}
