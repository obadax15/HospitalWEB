import 'package:flutter/material.dart';
import 'package:hospital/presntation/Screens/login/login_Screen.dart';


class App_Router {


  Route ?generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) =>  const LoginScreen());

    }

  }
}
