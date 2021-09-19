import 'package:flutter/material.dart';
class FlexibleWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextStyle ts1 = TextStyle(fontSize: 20, color: Colors.black);
    TextStyle ts2 = TextStyle(
        fontSize: 20, color: Colors.blue, fontWeight: FontWeight.bold);
    return Scaffold(
        appBar: AppBar(
          title: Text("Flexible Widget"),
        ),
        body:
    Column(
          children: [
            Flexible(
                flex: 4,
                child: Container(
                  color: Colors.orangeAccent,
                 // child:Text("h"),
                )),
            Flexible(
                flex: 1,
                child: Container(
                  color: Colors.blueAccent,
                )),
            Flexible(
                flex: 5,
                child: Container(
                  color: Colors.green,
                )),
            Flexible(
                flex: 3,
                child: Container(
                  color: Colors.purple,
                )),
          ],
        ));
  }
}
