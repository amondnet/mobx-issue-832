import 'package:flutter/material.dart';
import 'package:questionaire_app/answer.dart';
import 'package:questionaire_app/question.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  int _questionIndex = 0;
  final questions = [
      {
        "question": "Whats your favourite movie?",
        "answers": ["shawshank", "3 Idiots", "Dil chahta hai"]
      },
      {
        "question": "Whats your favourite Song?",
        "answers": ["Hurt me tomorrow", "Never give up", "Baby"]
      },
      {
        "question": "Whats your favourite bike?",
        "answers": ["Gixzer", "Apache R15", "Bukaati"]
      },
      {
        "question": "Whats your favourite show?",
        "answers": ["Breaking Bad", "2 and half man", "Mr bean"]
      },
    ];

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  void _resetHandler(){
    setState(() {
      _questionIndex = 0 ;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < questions.length ? Column(
          children: [
            Question(questions[_questionIndex]['question'] as String),
            ...(questions[_questionIndex]['answers'] as List<String>).map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList()
        ],
      ) : Column(
        children: [
          Center(child: Text('You did it and you were honest, :) ', textScaleFactor: 2,),),
          TextButton(child: Text('Restart',), onPressed: ()=> _resetHandler()),
        ],
      ),
    ));
  }
}
