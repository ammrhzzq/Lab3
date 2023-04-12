import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  final _questions = const [
    {
      'questionText': 'Whats your favorite color ?',
      'answers': [
        {'text': 'Black', 'score': 10},
        {'text': 'Red', 'score': 5},
        {'text': 'Green', 'score': 3},
        {'text': 'White', 'score': 1}
      ]
    },
    {
      'questionText': 'Whats your favorite animal ?',
      'answers': [
        {'text': 'Cat', 'score': 10},
        {'text': 'Snake', 'score': 5},
        {'text': 'Fish', 'score': 3},
        {'text': 'Dinosaur', 'score': 1}
      ]
    },
    {
      'questionText': 'What  is your favorite food  ?',
      'answers': [
        {'text': 'Nasi Lemak', 'score': 10},
        {'text': 'Roti Canai', 'score': 5},
        {'text': 'Lemang', 'score': 3},
        {'text': 'Chicken Rice', 'score': 1}
      ]
    }
  ];

  void _resetQuiz(){
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
    
  }
  void _answerQuestion(int score) {
    setState(() {
      _questionIndex += 1;
    });
    

    _totalScore += score;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color.fromARGB(255, 104, 180, 18)),
        ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Lab 3 ', style: TextStyle(fontSize: 15, color: Colors.black),),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                questions: _questions,
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
