import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/quiz.dart';
import 'package:flutter_complete_guide/result.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _questions = const[
    {
      'questionText': 'what\'s your favorite color?',
      'answers': [
        {'text':'Black','score':10},
        {'text':'Green','score':5},
        {'text':'Red','score':3},
        {'text':'White','score':1},
      ],
    },
    {
      'questionText': 'what\'s your favorite animal?',
      'answers': [
        {'text':'Rabbit','score':3},
        {'text':'Goat','score':12},
        {'text':'Horse','score':5},
        {'text':'Camel','score':9}
      ],
    },
    {
      'questionText': 'who\'s your favorite instructor?',
      'answers': [
        {'text':'Max','score':1},
        {'text':'Max','score':1},
        {'text':'Max','score':1},
        {'text':'Max','score':1},
      ],
    }
  ];
  var _questionIndex = 0;
  var _totalScore=0;
  void _resetQuiz()
  {
    setState(() {
      _questionIndex=0;
      _totalScore=0;
    });
  }
  void _answerQuestion(int score) {
    _totalScore+=score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
    if(_questionIndex<_questions.length)
      {
        print('We have more questions!');
      }
    else
      {
        print('No more questions!');
      }
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("My First App"),
        ),
        body: _questionIndex<_questions.length ?
               Quiz(questions:_questions,answerQuestion:_answerQuestion,questionIndex:_questionIndex)
              :Result(_totalScore,_resetQuiz),
      ),
    );
  }
}
