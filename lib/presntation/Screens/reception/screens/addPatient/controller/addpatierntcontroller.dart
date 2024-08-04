import 'package:flutter/material.dart';


class Patient {
  final List<TextEditingController> controllers;

  Patient()
      : controllers = List.generate(
    10, (index) => TextEditingController(),
  );
}