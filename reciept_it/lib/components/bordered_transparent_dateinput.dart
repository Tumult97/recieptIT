import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class BorderedTransparentInput extends StatefulWidget {

  final String hintText;
  final ValueChanged<String> onChanged;
  final Color mainColor;
  final Color hintColor;
  final TextInputType keyboardType;
  final Icon icon;
  final bool obscureText;

  const BorderedTransparentInput({
    Key key,
    @required this.hintText,
              this.onChanged,
    @required this.mainColor,
    @required this.hintColor,
    @required this.keyboardType,
              this.icon,
    @required this.obscureText
  }) : super(key: key);

  @override
  _BorderedTransparentInputState createState() => _BorderedTransparentInputState();
}

class _BorderedTransparentInputState extends State<BorderedTransparentInput> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: widget.keyboardType,
      cursorColor: widget.mainColor,
      style: TextStyle(
        color: widget.mainColor,
      ),
      obscureText: widget.obscureText,
      decoration: InputDecoration(
        prefixIcon: widget.icon,
        hintText: "${widget.hintText}",
        hintStyle: TextStyle(
            color: widget.hintColor
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.mainColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: widget.mainColor,
          ),
        ),
      ),
    );
  }

  _selectDate(BuildContext context) async {
    DateTime selectedDate = DateTime.now();
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }
}


