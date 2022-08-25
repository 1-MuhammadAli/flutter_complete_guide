import 'package:flutter/material.dart';
import './question.dart';
import 'answer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'what\'s your favorite color?',
        'answers': ['Black', 'Green', 'Red', 'White'],
      },
      {
        'questionText': 'what\'s your favorite animal?',
        'answers': ['Rabbit', 'Goat', 'Horse', 'Camel'],
      },
      {
        'questionText': 'who\'s your favorite instructor?',
        'answers': ['Max', 'Max', 'Max', 'Max'],
      }
    ];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'].toString(),
            ),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion,answer);
            }).toList(),
          ],
        ),
      ),
    );
  }
}
