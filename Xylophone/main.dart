import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.red,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.orange,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.yellow,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.green,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.blue,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.indigo,
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: Colors.purple,
            ),
          ),
        ],
      ),
    );
  }
}
