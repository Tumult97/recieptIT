import 'package:reciept_it/storage/types/receipttype.dart';

class Receipt {
  final int id;
  final String title;
  final String description;
  final DateTime dateAdded;
  final DateTime dateModified;
  final DateTime dateOfReceipt;
  final double amount;
  final String comments;
  final int fileId;
  final ReceiptType type;

  Receipt({this.type, this.id, this.title, this.description, this.dateAdded, this.dateModified, this.dateOfReceipt, this.amount, this.comments, this.fileId});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateAdded': dateAdded.toString(),
      'dateModified': dateModified.toString(),
      'dateOfReceipt': dateOfReceipt.toString(),
      'amount': amount,
      'comments': comments,
      'fileId': fileId,
      'type': type.toString(),
    };
  }
}