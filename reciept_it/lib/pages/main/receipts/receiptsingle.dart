import 'package:flutter/material.dart';
import 'package:reciept_it/components/bordered_transparent_input.dart';
import 'package:reciept_it/storage/models/receipt.dart';

class ReceiptSingle extends StatelessWidget {
  Receipt receipt;

  ReceiptSingle({this.receipt});

  @override
  Widget build(BuildContext context) {
    var map = ModalRoute.of(context).settings.arguments;
    //
    if(map != null){
      receipt = Receipt.fromMap(map);
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(21, 69, 81, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: BorderedTransparentInput(
              hintText: "Title",
              mainColor: Colors.white70,
              hintColor: Colors.white38,
              keyboardType: TextInputType.emailAddress,
              icon: Icon(Icons.email_outlined, color: Colors.white70,),
              obscureText: false,
              onChanged: (value) => {
                receipt.title = value
              },
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: BorderedTransparentInput(
              hintText: "Description",
              mainColor: Colors.white70,
              hintColor: Colors.white38,
              keyboardType: TextInputType.emailAddress,
              icon: Icon(Icons.email_outlined, color: Colors.white70,),
              obscureText: false,
              onChanged: (value) => {
                receipt.description = value
              },
            ),
          ),
        ],
      ),
    );
  }
}
