import 'package:hospital/constances/strings.dart';
import 'package:hospital/constances/token.dart';
import 'package:http/http.dart'as http;

class Get_Medical_Examination_Api{
static Future getMedExam()async{
  try{
    var response = await http.get(
        Uri.parse(
          "${Strings.api}/examinations",
        ),
        headers: {
          'Content-Type': 'application/json',
          'token':Token.token
        });
    print(response.body) ;
    if (response.statusCode==200) {
      return response.body ;
    }
  }catch(e){rethrow;}
}

}