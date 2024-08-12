import 'package:flutter/material.dart';


class LabController {
  final List<TextEditingController> controllers;

  LabController()
      : controllers = List.generate(
    8, (index) => TextEditingController(),
  );
}