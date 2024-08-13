import 'package:hospital/constances/strings.dart';
import 'package:hospital/constances/token.dart';
import 'package:http/http.dart'as http;
class Make_Examination_Read_Api{
  static Future makeExaminationRead(int id)async{
    try{
      var response =await http.post(Uri.parse( "${Strings.api}/notification/radio/$id",),
          headers: {
            'Content-Type': 'application/json',
            'token':Token.token
          }

      );
      print(response.body);
      if(response.statusCode==200){
        return response.body;
      }

    }catch(e){rethrow;}
  }

}