import 'package:flutter/material.dart';
class CircleAvatarWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CircleAvatar Widget"),
      ),
      body: Center(
        child: CircleAvatar(
            radius: 100,
            backgroundColor: Colors.blue.shade100,
            child: Container(
                padding: EdgeInsets.all(20),
                child: Image.asset(
                  'images/4.png',
                  fit: BoxFit.cover,
                ))),
      ),
    );
  }
}
