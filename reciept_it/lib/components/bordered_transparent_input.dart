import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class BorderedTransparentInput extends StatelessWidget {

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
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      cursorColor: mainColor,
      style: TextStyle(
        color: mainColor,
      ),
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: icon,
        hintText: "$hintText",
        hintStyle: TextStyle(
            color: hintColor
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: mainColor,
          ),
        ),
      ),
    );
  }
}
