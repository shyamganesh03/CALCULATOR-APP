import './Screen/CalculatorScreen.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MyCalculatorApp());
}

class MyCalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CalculatorMain(),
    );
  }
}
