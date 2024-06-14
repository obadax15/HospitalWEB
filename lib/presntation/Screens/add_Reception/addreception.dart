import 'package:flutter/material.dart';


class Character {
  final List<TextEditingController> controllers;

  Character()
      : controllers = List.generate(
    10, (index) => TextEditingController(),
  );
}