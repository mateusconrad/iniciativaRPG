import 'package:flutter/material.dart';
import 'package:rollini/home.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(
    ),
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
  ));
}