import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  const Display({
    Key key,
    @required this.value,
    @required this.error,
  }) : super(key: key);

  final String value;
  final bool error;

  @override
  Widget build(BuildContext context) {
    var textfield = TextFormField(
      textAlign: TextAlign.end,
      decoration: InputDecoration(
        hintText: (value == null) ? '0.0' : value,
        hintStyle: TextStyle(
          fontSize: error ? 20:30,
          color: Colors.red,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
    return textfield;
  }
}
