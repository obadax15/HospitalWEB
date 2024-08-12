import 'package:hospital/constances/strings.dart';
import 'package:http/http.dart' as http;

class Show_Rad_Emp_Api {
  static Future showRadEmp() async {
    try {
      var response = await http.get(
        Uri.parse("${Strings.api}/nonMedicals/2"),
        headers: {
        'Content-Type': 'application/json',
      });
      print(response.body);
      if(response.statusCode==200){
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }
}
