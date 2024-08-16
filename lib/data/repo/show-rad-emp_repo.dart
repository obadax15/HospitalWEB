import 'dart:convert';

import 'package:hospital/data/api/show-radio-emp_api.dart';

class Show_Rad_Emp_Repo {
  static Future showRadEmp() async {
    try {
      var response = await Show_Rad_Emp_Api.showRadEmp();
      return jsonDecode(response)['nonMedicals'];
    } catch (e) {
      rethrow;
    }
  }
}
