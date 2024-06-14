
import 'package:flutter/material.dart';
import 'package:hospital/presntation/Screens/home_Screen/homeScreen.dart';
import 'package:hospital/presntation/Screens/login/login_Screen.dart';
import 'package:hospital/presntation/Screens/make_forms/Screens/lab_form.dart';
import 'package:hospital/presntation/Screens/show_info/showEmployeeInfo.dart';

class App_Router {


  Route ?generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>   Show_Employee_Info(),);

    }

  }
}
