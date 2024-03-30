himport 'package:flutter/material.dart';
import "package:ecommerce/screens/login/login.dart";

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.purple,
          primary: Colors.purple,
          brightness: Brightness.light,
        )),
    home: LoginScreen(),
  ));
}
