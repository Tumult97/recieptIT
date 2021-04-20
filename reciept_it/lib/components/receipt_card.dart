import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reciept_it/storage/models/receipt.dart';
import 'package:reciept_it/storage/types/receipttype.dart';

class ReceiptCard extends StatelessWidget {

  Receipt receipt;
  DateFormat dtFormat = new DateFormat("EEE, MMM d yyyy");

  ReceiptCard({this.receipt});

  @override
  Widget build(BuildContext context) {
    IconData icon;

    switch(receipt.type){
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
    return GestureDetector(
      onLongPress: (){

      },
      child: Container(
        padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
        height: 120,
        width: double.maxFinite,
        child: Card(
          color: Color.fromRGBO(22, 70, 82, 1),
          elevation: 5,
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  child: Icon(
                    icon,
                    size: 50,
                    color: Colors.white54,
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Expanded(
                              flex: 1,
                              child: Center(
                                child: Text(
                                  receipt.title,
                                  style: TextStyle(
                                    color: Colors.white70,
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Text(
                                dtFormat.format(receipt.dateOfReceipt),
                                style: TextStyle(
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Column(
                          children: [
                            Flexible(
                              child: Text(
                                receipt.description,
                                overflow: TextOverflow.fade,
                                style: TextStyle(
                                  color: Colors.white54,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
