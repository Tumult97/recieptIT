import 'package:enum_to_string/enum_to_string.dart';
import 'package:reciept_it/storage/types/receipttype.dart';

class Receipt {
  int id;
  String title;
  String description;
  DateTime dateAdded;
  DateTime dateModified;
  DateTime dateOfReceipt;
  double amount;
  String comments;
  ReceiptType type;

  Receipt({this.type, this.id, this.title, this.description, this.dateAdded, this.dateModified, this.dateOfReceipt, this.amount, this.comments});

  Receipt.fromMap(Map<String, dynamic> map){
    id = map['id'];
    title = map['title'];
    description = map['description'];
    dateAdded = DateTime.parse(map['dateAdded'].toString());
    dateModified = DateTime.parse(map['dateModified'].toString());
    dateOfReceipt = DateTime.parse(map['dateOfReceipt'].toString());
    amount = map['amount'];
    comments = map['Comments'];
    type = EnumToString.fromString(ReceiptType.values, map['type'].toString());
  }

  Map<String, dynamic> toMap(){
    return {
      'title': title,
      'description': description,
      'dateAdded': dateAdded.toString(),
      'dateModified': dateModified.toString(),
      'dateOfReceipt': dateOfReceipt.toString(),
      'amount': amount,
      'comments': comments,
      //'fileId': fileId,
      'type': type.toString().replaceAll("ReceiptType.", ""),
    };
  }
}