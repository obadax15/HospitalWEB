import 'dart:convert';

import 'package:hospital/data/api/patient-view-api.dart';

class Patient_View_Repo{
  static Future ViewPatient()async{
    try{
      var response=await Patient_View_Api.ViewPatient();
      return jsonDecode(response);

    } catch(e){rethrow;}
  }

  static Future ViewPatientIn()async{
    try{
      var response=await Patient_View_Api.ViewPatientIn();
      return jsonDecode(response);

    } catch(e){rethrow;}
  }
}
