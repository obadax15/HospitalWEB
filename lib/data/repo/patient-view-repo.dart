import 'dart:convert';

import 'package:hospital/data/api/patient-view-api.dart';

class Patient_View_Repo{
  static Future ViewPatient()async{
    try{
      var response=await Patient_View_Api.ViewPatient();
      return jsonDecode(response);

    } catch(e){rethrow;}
  }

  static Future searchP(String search)async{
    try{
      var response=await Patient_View_Api.searchPatient(search);
      return jsonDecode(response)['patients'];

    } catch(e){rethrow;}
  }

  static Future ViewPatientIn()async{
    try{
      var response=await Patient_View_Api.ViewPatientIn();
      return jsonDecode(response);

    } catch(e){rethrow;}
  }

  static Future ViewPatientNotInRoom()async{
    try{
      var response=await Patient_View_Api.ViewPatientNotInRoom();
      return jsonDecode(response)['patient'];

    } catch(e){rethrow;}
  }

  static Future searchPIn(String search)async{
    try{
      var response=await Patient_View_Api.searchPatientIn(search);
      return jsonDecode(response)['patients'];

    } catch(e){rethrow;}
  }
}
