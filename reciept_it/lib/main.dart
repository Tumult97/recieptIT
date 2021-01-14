import 'package:flutter/material.dart';
import 'package:reciept_it/pages/login.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Login(),
      "/Login": (context) => Login()
    },
  ));
}