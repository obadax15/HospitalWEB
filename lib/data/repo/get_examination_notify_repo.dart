import 'dart:convert';

import 'package:hospital/data/api/get_examination_notify_api.dart';

class Get_Notify_Examination_Repo{
  static Future getNotifyExam()async
  {
    try{
      var response=await Get_Notify_Examination_Api.getNotifyExam();
      return  jsonDecode(response);
    }catch(e){rethrow;}
  }
}