import 'package:flutter/material.dart';
class MyColor{
  static const Color myBlue=Color.fromRGBO(175, 216, 251, 0.3);
  static const Color myBlue2=Color.fromRGBO(175, 216, 251, 1);
  static const Color mykhli=Color.fromRGBO(65, 99, 142, 1);
  static const Color myGrey=Color.fromRGBO(217, 217, 217, 1);
  static  final boxshadow=[
  BoxShadow(

  color: Colors.grey.withOpacity(0.5),
  spreadRadius: 1,
  blurRadius: 5,
  offset: const Offset(2, 2), // changes position of shadow
  ),
  BoxShadow(
  color: Colors.white.withOpacity(0.5),
  spreadRadius: 1,
  blurRadius: 5,
  offset: const Offset(-2, -2), // changes position of shadow
  )];
}