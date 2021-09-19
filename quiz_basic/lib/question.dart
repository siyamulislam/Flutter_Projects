import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;
  Question(this.questionText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.transparent,
      margin: EdgeInsets.all(20),
      child: Text(
        questionText,
        style: TextStyle(
          fontSize: 30 ,
          color: Colors.black,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
