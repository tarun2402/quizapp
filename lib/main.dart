import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'Q1. Who is the CEO of sunflowerlab?',
      'answers': [
        {'text': 'Purvik Rana', 'score': -2},
        {'text': 'Neha Amin', 'score': -2},
        {'text': 'Daniel Franco', 'score': 10},
        {'text': 'Smith vora', 'score': -2},
      ],
    },
    {
      'questionText': 'Q2. What HR of SunflowerLab?',
      'answers': [
        {'text': 'Tarun patel', 'score': -2},
        {'text': 'Purvik Rana', 'score': -2},
        {'text': 'Smith vora', 'score': -2},
        {'text': 'Neha Amin', 'score': 10},
      ],
    },
    {
      'questionText': ' Q3. Who is Mentor of  Flutter team ?',
      'answers': [
        {'text': 'Tarun Patel', 'score': -2},
        {'text': 'Smith vora', 'score': 10},
        {'text': 'Neha amin', 'score': -2},
        {'text': 'Megha Desai', 'score': -2},
      ],
    },
    {
      'questionText': 'Q4. Where  is sunf;owerlab?',
      'answers': [
        {'text': 'vadodara', 'score': 10},
        {'text': 'Ahmedabad', 'score': -2},
        {'text': 'Surat', 'score': -2},
        {'text': 'Anand', 'score': -2},
      ],
    },
    {
      'questionText': 'Q5. are you flutter developer?',
      'answers': [
        {
          'text': 'No',
          'score': -2,
        },
        {'text': 'Yes', 'score': 10},
      ],
    },
  ];

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < _questions.length) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('About Sunflowerlab'),
          backgroundColor: Colors.indigo,
        ),
        body: Padding(
          padding: const EdgeInsets.all(30.0),
          child: _questionIndex < _questions.length
              ? Quiz(
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex,
                  questions: _questions,
                ) //Quiz
              : Result(_totalScore, _resetQuiz),
        ), //Padding
      ), //Scaffold
      debugShowCheckedModeBanner: false,
    ); //MaterialApp
  }
}
