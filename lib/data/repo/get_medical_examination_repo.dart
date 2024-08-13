import 'dart:convert';

import 'package:hospital/data/api/get_medical_examination_api.dart';

class Get_Medical_Examination_Repo{
  static Future getMedExam()async
  {
  try{
    var response=await Get_Medical_Examination_Api.getMedExam();
  return  jsonDecode(response);
  }catch(e){rethrow;}
  }
}