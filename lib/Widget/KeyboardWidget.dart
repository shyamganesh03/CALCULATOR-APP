import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  const Keyboard({
    Key key,
    @required this.numbers,
    @required this.op,
  }) : super(key: key);

  final String numbers;
  final Function op;
  @override
  Widget build(BuildContext context) {
    var keybordWidget = Card(
      elevation: 20,
      child: RaisedButton(
        color: Colors.white70.withBlue(4),
        child: Center(
          child: Text(
            numbers,
            style: TextStyle(
              fontSize: 30,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        onPressed: () => op(numbers),
      ),
    );
    return keybordWidget;
  }
}
