import 'package:hospital/constances/strings.dart';
import 'package:http/http.dart 'as http;
class Patient_View_Api{
  static Future ViewPatient()async{
    try{
      var response=await http.get(
        Uri.parse("${Strings.api}/patient/getpatients"),
        headers: {
          'Content-Type': 'application/json',
        }
      );
      if(response.statusCode==200){
        return response.body;
      }

    }catch(e){rethrow;
    }
  }

  static Future ViewPatientIn()async{
    try{
      var response=await http.get(
        Uri.parse("${Strings.api}/patient/get_checkinPatient"),
        headers: {
          'Content-Type': 'application/json',
        }
      );
      if(response.statusCode==200){
        return response.body;
      }

    }catch(e){rethrow;
    }
  }
}