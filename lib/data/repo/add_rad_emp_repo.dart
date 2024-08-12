import 'dart:convert';

import 'package:hospital/data/api/add-rad_emp_api.dart';
import 'package:hospital/data/api/add_labrotary_api.dart';
import 'package:hospital/data/api/patient_api.dart';

class Add_Rad_Emp_Repop {
  static Future createRadEmp(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , ) async {
    try {
      print('lljlklk') ;
      var response = await Add_Rad_Api.createRadEmp(name, number, father , mother , inNumber , location , gender , birthdate) ;
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }
}