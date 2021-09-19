import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final selectedHandler;
  final answerText;
  Answer(this.selectedHandler,this.answerText);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        
        child: Text(answerText),
        onPressed: selectedHandler,
      ),
    );
  }
}
