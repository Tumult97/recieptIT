import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:reciept_it/pages/login.dart';
import 'package:reciept_it/pages/main/receipts/receiptsingle.dart';
import 'package:reciept_it/pages/main/receipts/receiptslist.dart';
import 'package:reciept_it/pages/main/receipts/test.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: "/",
    routes: {
      "/": (context) => Login(),
      "/Login": (context) => Login(),
      "/ReceiptsList": (context) => ReceiptsList(),
      "/ReceiptSingle": (context) => ReceiptSingle(),
      "/Test": (context) => SelectListItem()
    },
  ));
}