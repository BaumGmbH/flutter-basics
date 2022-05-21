import 'package:flutter/material.dart';

import './quiz.dart';
import './result.dart';

void main() => runApp(App());

class App extends StatefulWidget {
   @override
   State<StatefulWidget> createState() {
      return _AppState();
   }
}

class _AppState extends State<App> {
   static const _questions = [
      {
         'question': 'Whats\'s your favourite color?',
         'answers': [
            {'text': 'Black', 'score': 10},
            {'text': 'Red', 'score': 6},
            {'text': 'Green', 'score': 3},
            {'text': 'White', 'score': 1},
         ],
      },
      {
         'question': 'Whats\'s your favourite animal?',
         'answers': [
            {'text': 'Cat', 'score': 1},
            {'text': 'Dog', 'score': 2},
            {'text': 'Rabbit', 'score': 3},
            {'text': 'Lion', 'score': 9},
         ],
      },
      {
         'question': 'Whats\'s your favourite programmer?',
         'answers': [
            {'text': 'Manuel', 'score': 10},
            {'text': 'Manuel der Gott', 'score': 5},
            {'text': 'Manuel der ultimative Gott', 'score': 2},
            {'text': 'Manuel der ultimative Gott über alles', 'score': 0}
         ],
      },
   ];

   int _questionIndex = 0;
   int _totalScore = 0;

	@override
  	Widget build(BuildContext context) {
		return MaterialApp(
		  	home: Scaffold(
				appBar: AppBar(
					title: Text('My First App'),
				),
				body: _questionIndex < _questions.length
               ? Quiz(
                  questions: _questions,
                  questionIndex: _questionIndex,
                  answerQuestion: _answerQuestion,
               )
               : Result(_totalScore),
		  	),
		);
  	}

   void _answerQuestion(int score) {
      _totalScore += score;

      setState(() {
         _questionIndex++;
      });
   }
}