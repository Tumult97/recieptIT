class File{
  final int id;
  final List<String> bytes;
  final DateTime dateAdded;
  final String fileName;

  File({
    this.id,
    this.bytes,
    this.dateAdded,
    this.fileName
  });

  Map<String, dynamic> toMap(){
    return{
      'id': id,
      'bytes': bytes,
      'dateAdded': dateAdded,
      'fileName': fileName,
    };
  }
}