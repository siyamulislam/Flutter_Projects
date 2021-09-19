import 'package:flutter/material.dart';
import './result.dart';
import './quiz.dart';

void main() => runApp(MyApp());

//void main() {
//runApp(MyApp());
//}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _qst = 0;
  var _tScore = 0;
  void _resetQz() {
    /*setState(() {
      
      _qst = 0;
      _tScore = 0;
    });*/

    
  }

  void _q1(int score) {
    _tScore = _tScore + score;
    setState(() {
      _qst = _qst + 1;
      //  if (_qst > 3) _qst = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': 'Whats ur favorite color?',
        'answer': [
          {'text': 'red', 'score': 10},
          {'text': 'black', 'score': 5},
          {'text': 'blue', 'score': 2},
          {'text': 'pink', 'score': 1},
        ],
      },
      {
        'questionText': 'Whats ur favorite pet?',
        'answer': [
          {'text': 'dog', 'score': 10},
          {'text': 'bird', 'score': 5},
          {'text': 'cat', 'score': 2},
          {'text': 'snake', 'score': 1},
        ],
      },
      {
        'questionText': 'Whats ur favorite bike?',
        'answer': [
          {'text': 'yamaha', 'score': 10},
          {'text': 'honda', 'score': 5},
          {'text': 'suzuki', 'score': 2},
          {'text': 'bajaj', 'score': 1},
        ],
      },
      {
        'questionText': 'Whats ur favorite mobile?',
        'answer': [
          {'text': 'nokia', 'score': 10},
          {'text': 'xaiomi', 'score': 5},
          {'text': 'apple', 'score': 2},
          {'text': 'vivo', 'score': 1},
        ],
      },
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.purple,
          toolbarHeight: 60,
          title: Text("Home"),
        ),
        body: _qst < _questions.length
            ? Quiz(_questions, _q1, _qst)
            : Result(_tScore, _resetQz),
      ),
    );
  }
}
