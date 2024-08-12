import 'dart:convert';

import 'package:hospital/data/api/create_doctor_api.dart';

class CreateDoctorRepo {
  static Future createDoctor(String name , String number , String father , String mother , String inNumber , String location , String gender , String birthdate , int id) async {
    try {
      var response = await CreateDoctorApi.createDoctor(name, number, father, mother, inNumber, location, gender, birthdate, id) ;
      return jsonDecode(response) ;
    } catch (e) {
      rethrow ;
    }
  }
}