import 'package:flutter/material.dart';
import 'package:reciept_it/pages/login.dart';
import 'package:reciept_it/pages/main/receipts/receiptslist.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Login(),
      "/Login": (context) => Login(),
      "/ReceiptsList": (context) => ReceiptsList(),
    },
  ));
}