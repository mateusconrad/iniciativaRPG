import 'package:flutter/material.dart';
import 'package:flutter_app/login/login.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: LoginMestre(),
    theme: ThemeData(
      brightness: Brightness.dark,
    ),
  ));
}