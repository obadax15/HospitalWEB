import 'package:hospital/constances/strings.dart';
import 'package:hospital/constances/token.dart';
import 'package:http/http.dart' as http;

class Show_Labrotary_Emp_Api {
  static Future ShowLabEmp() async {
    try {
      var response = await http.get(
          Uri.parse(
            "${Strings.api}/nonMedicals/1",
          ),
          headers: {
            'Content-Type': 'application/json',
          });
      print(response.body);
      if (response.statusCode == 200) {
        return response.body;
      }
    } catch (e) {
      rethrow;
    }
  }


}
