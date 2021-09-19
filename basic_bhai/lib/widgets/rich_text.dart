
import 'package:flutter/material.dart';

class RichTextt extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    TextStyle ts1= TextStyle(fontSize: 20,color: Colors.black);
    TextStyle ts2= TextStyle(fontSize: 20,color: Colors.blue,fontWeight: FontWeight.bold);
    return Scaffold(
      appBar: AppBar(
        title: Text("Rich Text"),
      ),
      body: Center(
        child: RichText(text: TextSpan(
          style: ts1,
              children: [
                TextSpan(text: "I am the "),
                TextSpan(text: "Rich Text. ",style: ts2),
                TextSpan(text: "Widget of "),
                TextSpan(text: "Flutter",style: ts2),
            ]
        )),
      ),
    );
  }
}
