import 'dart:convert';

import 'package:hospital/data/api/add_labrotary_api.dart';
import 'package:hospital/data/api/patient_api.dart';
import 'package:hospital/data/api/show_labrotary_emp_api.dart';

class Add_Labrotary_Repo {
  static Future createLabEmp(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , ) async {
    try {
      print('lljlklk') ;
      var response = await Add_Labrotary_Api.createLabEmp(name, number, father , mother , inNumber , location , gender , birthdate) ;
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }
  static Future deleteLabEmp(int id) async {
    try {
      var response = await Add_Labrotary_Api.deleteLabEmp(id);
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }

  static Future getLabEmpDetails(int id) async {
    try {
      var response = await Add_Labrotary_Api.getLabEmpDetails(id);
      return jsonDecode(response);
    } catch (e) {
      rethrow ;
    }
  }
  static Future edit_Lab_Emp(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , int id) async {
    try {
      var response = await Add_Labrotary_Api.edit_Lab_Emp(name, number, father, mother, inNumber, location, gender, birthdate, id);
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }
}