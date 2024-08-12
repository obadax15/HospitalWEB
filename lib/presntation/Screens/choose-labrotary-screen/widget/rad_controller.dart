import 'package:flutter/material.dart';


class RadController {
  final List<TextEditingController> controllers;

  RadController()
      : controllers = List.generate(
    8, (index) => TextEditingController(),
  );
}