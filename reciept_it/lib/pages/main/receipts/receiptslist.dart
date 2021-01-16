import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reciept_it/components/receipt_card.dart';
import 'package:reciept_it/storage/logic/connection.dart';
import 'package:reciept_it/storage/models/receipt.dart';
import 'package:reciept_it/storage/types/receipttype.dart';

class ReceiptsList extends StatefulWidget {
  @override
  _ReceiptsListState createState() => _ReceiptsListState();
}

class _ReceiptsListState extends State<ReceiptsList> {
  List<Receipt> response;
  List<Receipt> selectedList = new List<Receipt>();
  DateFormat dtFormat = new DateFormat("EEE, MMM d yyyy");

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: FutureBuilder<List<Receipt>>(
    //     future: Connection.listReceipt(),
    //     builder: (BuildContext context, AsyncSnapshot<List<Receipt>> snapshot){
    //       if(!snapshot.hasData){
    //         return CircularProgressIndicator();
    //       }
    //       else{
    //         response = snapshot.data;
    //         response = new List();
    //         response.add(Receipt(
    //           id: 1,
    //           title: "Title 1",
    //           description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Netus et malesuada fames ac turpis egestas sed tempus urna. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. A lacus vestibulum sed arcu.",
    //           dateAdded: DateTime.now(),
    //           dateModified: DateTime.now(),
    //           dateOfReceipt: DateTime.now(),
    //           amount: 243.79,
    //           comments: "Pick n' Pay",
    //           type: "Grocery",
    //         ));
    //         response.add(Receipt(
    //           id: 1,
    //           title: "Title 2",
    //           description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Netus et malesuada fames ac turpis egestas sed tempus urna. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. A lacus vestibulum sed arcu.",
    //           dateAdded: DateTime.now(),
    //           dateModified: DateTime.now(),
    //           dateOfReceipt: DateTime.now().add(Duration(
    //               days: -3
    //           )),
    //           amount: 300.00,
    //           comments: "Sasol",
    //           type: "Petrol",
    //         ));
    //         response.add(Receipt(
    //           id: 1,
    //           title: "Title 3",
    //           description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Netus et malesuada fames ac turpis egestas sed tempus urna. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. A lacus vestibulum sed arcu.",
    //           dateAdded: DateTime.now(),
    //           dateModified: DateTime.now(),
    //           dateOfReceipt: DateTime.now().add(Duration(
    //               days: 30
    //           )),
    //           amount: 243.79,
    //           comments: "Pick n' Pay",
    //           type: "Grocery",
    //         ));
    //         return Placeholder();
    //       }
    //     },
    //   ),
    // );
    Connection.initDb();
    response = new List();
    // Connection.insertReceipt(Receipt(
    //   id: 1,
    //   title: "Title 1",
    //   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Netus et malesuada fames ac turpis egestas sed tempus urna. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. A lacus vestibulum sed arcu.",
    //   dateAdded: DateTime.now(),
    //   dateModified: DateTime.now(),
    //   dateOfReceipt: DateTime.now(),
    //   amount: 243.79,
    //   comments: "Pick n' Pay",
    //   type: ReceiptType.grocery,
    // ));
    // Connection.insertReceipt(Receipt(
    //   id: 1,
    //   title: "Title 2",
    //   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Netus et malesuada fames ac turpis egestas sed tempus urna. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. A lacus vestibulum sed arcu.",
    //   dateAdded: DateTime.now(),
    //   dateModified: DateTime.now(),
    //   dateOfReceipt: DateTime.now().add(Duration(
    //       days: -3
    //   )),
    //   amount: 300.00,
    //   comments: "Sasol",
    //   type: ReceiptType.petrol,
    // ));
    // Connection.insertReceipt(Receipt(
    //   id: 1,
    //   title: "Title 3",
    //   description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Netus et malesuada fames ac turpis egestas sed tempus urna. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. A lacus vestibulum sed arcu.",
    //   dateAdded: DateTime.now(),
    //   dateModified: DateTime.now(),
    //   dateOfReceipt: DateTime.now().add(Duration(
    //       days: -30,
    //       seconds: -50000
    //   )),
    //   amount: 700.00,
    //   comments: "Steam",
    //   type: ReceiptType.game,
    // ));

    // var list = Connection.listReceipt();

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Receipts"),
      //   backgroundColor: Color.fromRGBO(21, 69, 81, 1),
      // ),
      backgroundColor: Color.fromRGBO(11, 35, 41, 1),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Color.fromRGBO(96, 148, 163, 1),
        onPressed: () async {
          var list = await Connection.listReceipt();
          print(list.length);
          print(list[0].toMap());
        },
      ),
      body: ListView.builder(
        itemCount: response.length,
        itemBuilder: (context, index){
          return ReceiptCard(receipt: response[index],);
        },
      ),
    );
  }
}
