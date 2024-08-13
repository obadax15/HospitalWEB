import 'dart:convert';

import 'package:hospital/constances/strings.dart';
import 'package:hospital/constances/token.dart';
import 'package:http/http.dart'as http;
class Add_Response_Medical_Examination{
  static Future AddResponseMedicalExamination(String responseexam , int id)async{
    try{
      var  response =await http.post(Uri.parse("${Strings.api}/examinations/response/$id"),

          headers: {
          'Content-Type': 'application/json',
          'token':Token.token
          },
          body:  jsonEncode({
            'response': responseexam,
          })
      );
      print(response.body);
      if(response.statusCode==200){
        return response.body;
      }

    }catch(e){rethrow;}

  }

}