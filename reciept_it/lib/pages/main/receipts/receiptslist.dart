import 'package:flutter/material.dart';
import 'package:reciept_it/storage/logic/connection.dart';
import 'package:reciept_it/storage/models/receipt.dart';
import 'package:reciept_it/storage/types/filetype.dart';
import 'package:reciept_it/storage/types/receipttype.dart';

class ReceiptsList extends StatefulWidget {
  @override
  _ReceiptsListState createState() => _ReceiptsListState();
}

class _ReceiptsListState extends State<ReceiptsList> {
  List<Receipt> response;

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

    response = new List();
    response.add(Receipt(
      id: 1,
      title: "Title 1",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Netus et malesuada fames ac turpis egestas sed tempus urna. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. A lacus vestibulum sed arcu.",
      dateAdded: DateTime.now(),
      dateModified: DateTime.now(),
      dateOfReceipt: DateTime.now(),
      amount: 243.79,
      comments: "Pick n' Pay",
      type: ReceiptType.grocery,
    ));
    response.add(Receipt(
      id: 1,
      title: "Title 2",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Netus et malesuada fames ac turpis egestas sed tempus urna. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. A lacus vestibulum sed arcu.",
      dateAdded: DateTime.now(),
      dateModified: DateTime.now(),
      dateOfReceipt: DateTime.now().add(Duration(
          days: -3
      )),
      amount: 300.00,
      comments: "Sasol",
      type: ReceiptType.petrol,
    ));
    response.add(Receipt(
      id: 1,
      title: "Title 3",
      description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet consectetur. Netus et malesuada fames ac turpis egestas sed tempus urna. Dictum fusce ut placerat orci nulla pellentesque dignissim enim sit. A lacus vestibulum sed arcu.",
      dateAdded: DateTime.now(),
      dateModified: DateTime.now(),
      dateOfReceipt: DateTime.now().add(Duration(
        days: -30,
        seconds: -50000
      )),
      amount: 700.00,
      comments: "Steam",
      type: ReceiptType.game,
    ));

    return ListView.builder(
      itemCount: response.length,
      itemBuilder: (context, index){
        IconData icon;

        switch(response[index].type){
          case ReceiptType.game:
            icon = Icons.videogame_asset_outlined;
            break;
          case ReceiptType.grocery:
            icon = Icons.shopping_basket_outlined;
            break;
          case ReceiptType.hygiene:
            icon = Icons.soap_outlined;
            break;
          case ReceiptType.petrol:
            icon = Icons.directions_car_outlined;
            break;
          case ReceiptType.utility:
            icon = Icons.settings_applications;
            break;
          default:
            icon = Icons.money;
            break;
        }

        return Container(
          padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          height: 120,
          width: double.maxFinite,
          child: Card(
            elevation: 5,
            child: Container(
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Icon(icon),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
