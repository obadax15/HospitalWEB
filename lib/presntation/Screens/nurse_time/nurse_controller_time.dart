import 'package:flutter/material.dart';


class NurseTimeController {
  final List<TextEditingController> controllers;

  NurseTimeController()
      : controllers = List.generate(
    14, (index) => TextEditingController(),
  );
}