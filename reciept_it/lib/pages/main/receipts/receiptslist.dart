import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:reciept_it/components/receipt_card.dart';
import 'package:reciept_it/pages/main/receipts/receiptsingle.dart';
import 'package:reciept_it/storage/logic/connection.dart';
import 'package:reciept_it/storage/models/receipt.dart';

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

    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Receipts"),
      //   backgroundColor: Color.fromRGBO(21, 69, 81, 1),
      // ),
    backgroundColor: Color.fromRGBO(11, 35, 41, 1),
      body: FutureBuilder<List<Receipt>>(
        future: Connection.listReceipt(),
        builder: (BuildContext context, AsyncSnapshot<List<Receipt>> snapshot){
          if(!snapshot.hasData){
            return Center(child: CircularProgressIndicator());
          }
          else{
            response = snapshot.data;
            return Container(
              child: ListView.builder(
                itemCount: response.length,
                itemBuilder: (context, index){
                  return Dismissible(
                    key: Key(response[index].id.toString()),
                    child: ReceiptCard(receipt: response[index],),
                    onDismissed: (DismissDirection direction){
                      //print(response[index].title);
                      Connection.deleteReceipt(response[index].id);
                      setState(() {
                        response.remove(response[index]);
                      });
                    },
                  );
                },
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          //Navigator.pushNamed(context, "ReceiptSingle", arguments: Receipt().toMap());
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ReceiptSingle(receipt: Receipt(),))
          );
        },
      ),
    );
  }
}
