
import 'package:flutter/material.dart';
import 'package:hospital/presntation/Screens/admin/add_Reception/Screens/showReception.dart';
import 'package:hospital/presntation/Screens/admin/general_emp_info/general_emp_info.dart';
import 'package:hospital/presntation/Screens/admin/manager_Screen/managerScreen.dart';
import 'package:hospital/presntation/Screens/admin/show_info/showEmployeeInfo.dart';
import 'package:hospital/presntation/Screens/doctor/doctor_drawer_screen.dart';
import 'package:hospital/presntation/Screens/examination/add_examination_screen.dart';
import 'package:hospital/presntation/Screens/forms/make_forms/Screens/lab_form.dart';
import 'package:hospital/presntation/Screens/login/login_Screen.dart';
import 'package:hospital/presntation/Screens/reception/receptionscreen.dart';
import 'package:hospital/presntation/Screens/reception/screens/startreceptopn_screen/start_reception_screen.dart';


class App_Router {


  Route ?generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>  AddExaminationScreen());

    }

  }
}
