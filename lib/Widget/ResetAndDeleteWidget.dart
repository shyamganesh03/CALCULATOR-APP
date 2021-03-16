import 'package:flutter/material.dart';

class ResetAndDelete extends StatelessWidget {
  const ResetAndDelete({
    Key key,
    @required this.op,
  }) : super(key: key);
  final Function op;
  @override
  Widget build(BuildContext context) {
    var dr = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          height: 80,
          width: 120,
          child: Card(
            elevation: 20,
            child: RaisedButton(
              color: Colors.white70.withBlue(4),
              child: Text(
                'RESET',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => op('RESET'),
            ),
          ),
        ),
        Container(
          height: 80,
          width: 140,
          child: Card(
            elevation: 20,
            child: RaisedButton(
              color: Colors.white70.withBlue(4),
              child: Text(
                'DELETE',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onPressed: () => op('DELETE'),
            ),
          ),
        ),
      ],
    );
    return dr;
  }
}
