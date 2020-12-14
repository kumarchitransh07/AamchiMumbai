import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';
// void main() {
//   runApp(MyApp());
// }

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  final _questions = const [
    {
      'questionText': 'When was Mumbai name officially changed from Bombay?',
      'answers': [
        {'text': '1995', 'score': 4},
        {'text': '1987', 'score': -1},
        {'text': '2000', 'score': -1},
        {'text': '1993', 'score': -1},
      ],
    },
    {
      'questionText': 'What event does Mumbai Gateway of India commemorate?',
      'answers': [
        {'text': 'King George V 1911 visit', 'score': 4},
        {'text': 'India Indeoendence from Britian', 'score': -1},
        {'text': 'City Status as an international port', 'score': -1},
        {'text': 'Victims of 1896 plague', 'score': -1},
      ],
    },
    {
      'questionText':
          'Which major Mumbai festival honors the elephant-headed Hindu god of wisdom?',
      'answers': [
        {'text': 'Holi', 'score': -1},
        {'text': 'Ganesh Chaturthi', 'score': 4},
        {'text': 'Elephanta Festiva;', 'score': -1},
        {'text': 'Naag Panchami', 'score': -1},
      ],
    },
    {
      'questionText':
          'The original site of Mumbai started as a group of how many islands?',
      'answers': [
        {'text': '3', 'score': -1},
        {'text': '7', 'score': 4},
        {'text': '12', 'score': -1},
        {'text': '18', 'score': -1},
      ],
    },
    {
      'questionText': ' Which is the oldest temple of Mumbai?',
      'answers': [
        {'text': 'Bablunath', 'score': 4},
        {'text': 'Walkeshwar', 'score': -1},
        {'text': 'Mumba Devi Temple', 'score': -1},
        {'text': 'Siddhivinayak', 'score': -1},
      ],
    },
    {
      'questionText': 'From where to where did the first Mumbai local run?',
      'answers': [
        {'text': 'CST to Andheri', 'score': -1},
        {'text': 'CST to Thane', 'score': 4},
        {'text': 'Churchgate to Bandra', 'score': -1},
        {'text': 'Churchgate to Mahim', 'score': -1},
      ],
    },
    {
      'questionText': 'One of these is NOT the island on Mumbai',
      'answers': [
        {'text': 'Altamount', 'score': 4},
        {'text': 'Oyster Rock', 'score': -1},
        {'text': 'Salsette', 'score': -1},
        {'text': 'Cross', 'score': -1},
      ],
    },
    {
      'questionText': 'Mumbai overlooks what large body of water?',
      'answers': [
        {'text': 'Indian Ocean', 'score': -1},
        {'text': 'Arabian Sea', 'score': 4},
        {'text': 'Bay of Bengal', 'score': -1},
        {'text': 'Andaman Sea', 'score': -1},
      ],
    },
    {
      'questionText': 'What is the length of Marine Drive?',
      'answers': [
        {'text': '3.5', 'score': 4},
        {'text': '2.5', 'score': -1},
        {'text': '4', 'score': -1},
        {'text': '5', 'score': -1},
      ],
    },
    {
      'questionText': 'How many municipal wards does Mumbai have?',
      'answers': [
        {'text': '21', 'score': -1},
        {'text': '24', 'score': 4},
        {'text': '27', 'score': -1},
        {'text': '26', 'score': -1},
      ],
    },
    {
      'questionText': 'Which is the oldest theatre in Mumbai?',
      'answers': [
        {'text': 'Roshan Talkies', 'score': -1},
        {'text': 'Capitol Cinema House', 'score': 4},
        {'text': 'Edward Theatre', 'score': -1},
        {'text': 'Imperial Cinema House', 'score': -1},
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
    // var aBool = true;
    // aBool = false;

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
    // var dummy = const ['Hello'];
    // dummy.add('Max');
    // print(dummy);
    // dummy = [];
    // questions = []; // does not work if questions is a const

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
          backgroundColor: Colors.purple,
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              )
            : Result(_totalScore, _resetQuiz),
      ),
    );
  }
}
