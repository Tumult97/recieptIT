import 'package:flutter/material.dart';

void main() => runApp(SelectListItem());


class SelectListItem extends StatefulWidget {
  @override
  _SelectListItemState createState() => _SelectListItemState();
}

class _SelectListItemState extends State<SelectListItem> {

  List<int> _selectedItems = List<int>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Select List Items'),
        ),
        body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index){
            return
              Container(
                color: (_selectedItems.contains(index)) ? Colors.blue.withOpacity(0.5) : Colors.transparent,
                child: ListTile(
                  onTap: (){
                    if(_selectedItems.contains(index)){
                      setState(() {
                        _selectedItems.removeWhere((val) => val == index);
                      });
                    }
                  },
                  onLongPress: (){
                    if(! _selectedItems.contains(index)){
                      setState(() {
                        _selectedItems.add(index);
                      });
                    }
                  },
                  title: Text('$index'),
                ),
              );
          },
        ),
      ),
    );
  }
}