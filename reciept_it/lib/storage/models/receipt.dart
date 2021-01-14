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

  Receipt({this.id, this.title, this.description, this.dateAdded, this.dateModified, this.dateOfReceipt, this.amount, this.comments, this.fileId});

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateAdded': dateAdded,
      'dateModified': dateModified,
      'dateOfReceipt': dateOfReceipt,
      'amount': amount,
      'comments': comments,
      'fileId': fileId,
    };
  }
}