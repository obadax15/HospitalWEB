import 'dart:convert';

import 'package:hospital/data/api/patient-view-api.dart';
import 'package:hospital/data/api/show_labrotary_emp_api.dart';

class Show_Labrotary_Emp_Repo{
  static Future ShowLabEmp()async{
    try{
      var response=await Show_Labrotary_Emp_Api.ShowLabEmp();
      return jsonDecode(response)['nonMedicals'];

    } catch(e){rethrow;}
  }

}
