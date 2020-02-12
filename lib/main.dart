import 'package:flutter/material.dart';
import 'package:rollini/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginPage(
    ),
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
  ));
}