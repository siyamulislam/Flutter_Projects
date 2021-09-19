import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object>> questions;
  final Function q1;
  final int qst;

  Quiz(this.questions, this.q1, this.qst);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.red,
          ),
          child: Text(
            'QUIZ-1',
            style: TextStyle(fontSize: 40, color: Colors.white),
          ),
        ),
        Question(
          questions[qst]['questionText'] as String,
        ),
        ...(questions[qst]['answer'] as List<Map<String,Object>> ).map((answer) {
          return Answer(()=>q1(answer['score']), answer["text"]);
        }).toList(),
      ],
    );
  }
}
