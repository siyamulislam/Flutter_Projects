import 'package:flutter/material.dart';

class FittedBoxWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle ts2 = TextStyle(
        fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold);
    return Scaffold(
        appBar: AppBar(
          title: Text("FittedBox Widget"),
        ),
        body: Center(
          child: Container(
            color: Colors.yellow,
            height: 300,
            width: 300,
            child: FittedBox(
              child: Center(
                child: Text("FittedBox", style: ts2),
              ),
            ),
          ),
        ));
  }
}
