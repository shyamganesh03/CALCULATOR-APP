import 'package:flutter/material.dart';
import '../Widget/KeyboardWidget.dart';
import '../Widget/ResetAndDeleteWidget.dart';
import '../Widget/displaywidget.dart';

class CalculatorMain extends StatefulWidget {
  @override
  _CalculatorMainState createState() => _CalculatorMainState();
}

class _CalculatorMainState extends State<CalculatorMain> {
  String value;
  double result = 0.0;
  bool error = false;
  List<String> values = [];
  String op;
  final List numbers = [
    '7',
    '8',
    '9',
    '+',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '*',
    '.',
    '0',
    '=',
    '/',
  ];
  void operation(String numbers) {
    setState(() {
      if ((numbers != '+') ||
          (numbers != '-') ||
          (numbers != '/') ||
          (numbers != '*')) {
        value = ((value == null && op == null) || (value == '0.0'))
            ? numbers
            : value + numbers;
      }
      if ((numbers == '+') ||
          (numbers == '-') ||
          (numbers == '/') ||
          (numbers == '*')) {
        value = (value + numbers);
        value = value.substring(0, value.length - 1);
        op = numbers;
      }
      try {
        if (numbers == '=') {
          switch (op) {
            case '+':
              result = double.parse(value.substring(0, value.indexOf('+'))) +
                  double.parse(value.substring(
                      value.indexOf('+') + 1, value.length - 1));
              break;
            case '-':
              result = double.parse(value.substring(0, value.indexOf('-'))) -
                  double.parse(value.substring(
                      value.indexOf('-') + 1, value.length - 1));
              break;
            case '*':
              result = double.parse(value.substring(0, value.indexOf('*'))) *
                  double.parse(value.substring(
                      value.indexOf('*') + 1, value.length - 1));
              break;
            case '/':
              result = double.parse(value.substring(0, value.indexOf('/'))) /
                  double.parse(value.substring(
                      value.indexOf('/') + 1, value.length - 1));
              break;
          }
          value = value + result.toString();
        }
      } catch (e) {
        value = e.toString();
        error = true;
      }
      if (numbers == 'RESET') value = '0.0';
      if (numbers == 'DELETE') value = value.substring(0, value.length - 7);
      if (value.length == 0) value = '0.0';
    });
  }

  @override
  Widget build(BuildContext context) {
    final mediaquery = MediaQuery.of(context);
    var appbar = AppBar(
      title: Text(
        'CALCULATOR',
        style: TextStyle(
            color: Colors.yellow, fontSize: 22, fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.deepPurple,
    );
    final height = mediaquery.size.height -
        appbar.preferredSize.height -
        mediaquery.padding.top;
    var disp = Container(
      height: height * 0.2,
      color: Colors.black,
      child: Display(
        value: value,
        error: error,
      ),
    );
    var keybord = Container(
      height: height * 0.7,
      width: double.infinity,
      color: Colors.blueGrey,
      child: Card(
        elevation: 30,
        color: Colors.blueGrey,
        child: GridView.count(
          crossAxisCount: 4,
          children: List.generate(16, (index) {
            return Keyboard(
              numbers: numbers[index],
              op: operation,
            );
          }),
        ),
      ),
    );
    var dr = Container(
      height: height * 0.1,
      width: double.infinity,
      color: Colors.blueGrey,
      child: ResetAndDelete(
        op: operation,
      ),
    );
    return Scaffold(
      appBar: appbar,
      body: Column(
        children: [
          disp,
          keybord,
          dr,
        ],
      ),
    );
  }
}
