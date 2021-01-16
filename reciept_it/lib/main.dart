import 'package:flutter/material.dart';
import 'package:reciept_it/pages/login.dart';
import 'package:reciept_it/pages/main/receipts/receiptslist.dart';
import 'package:reciept_it/pages/main/receipts/test.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Login(),
      "/Login": (context) => Login(),
      "/ReceiptsList": (context) => ReceiptsList(),
      "/Test": (context) => SelectListItem()
    },
  ));
}