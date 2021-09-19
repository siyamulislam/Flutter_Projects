import 'package:flutter/material.dart';

import 'package:basic_bhai/count.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FD HP"),
      ),
      body: Center(
        child: Count(
          count: count,
          onCountSelected: () => print("Counter Selected!"),
        ),
      ),
    );
  }
}
