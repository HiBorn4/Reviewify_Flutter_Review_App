// This imports the necessary Flutter material library.
import 'package:flutter/material.dart';
// These two lines import the quiz.dart and result.dart files from the current directory.

import "./quiz.dart";
import "result.dart";

// This is the main entry point for the application, and it runs the MyApp widget.

void main() => runApp(const MyApp());

// This is the MyApp widget, which extends StatefulWidget. It creates a new _MyAppState
// object when the widget is built.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// This is the _MyAppState class, which extends State<MyApp>. It contains two instance
// variables, questionIndex and total_score.
class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  // ignore: non_constant_identifier_names
  int total_score = 0;

// This is the build method, which creates the UI for the app. It defines a const list of
// maps called questions, which contains the quiz questions and their respective answers.
  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questiontext':
            "How would you rate the overall user experience of the app?",
        'answers': [
          {'text': 'Excellent', 'score': 10},
          {'text': 'Good', 'score': 7},
          {'text': 'Average', 'score': 4},
          {'text': 'Poor', 'score': 1},
        ]
      },
      {
        'questiontext': "How useful did you find the trip planning feature?",
        'answers': [
          {'text': 'Very useful', 'score': 10},
          {'text': 'Somewhat useful', 'score': 7},
          {'text': 'Not very useful', 'score': 4},
          {'text': 'Not useful at all', 'score': 1}
        ]
      },
      {
        'questiontext':
            "How accurate and reliable were the real-time navigation instructions and live locations?",
        'answers': [
          {'text': 'Very accurate and reliable', 'score': 10},
          {'text': 'Somewhat accurate and reliable', 'score': 7},
          {'text': 'Not very accurate and reliable', 'score': 4},
          {'text': 'Not accurate and reliable at all', 'score': 1}
        ]
      },
      {
        'questiontext':
            "Did you find the group chats and calls feature helpful for staying connected with other travelers?",
        'answers': [
          {'text': 'Extremely helpful', 'score': 10},
          {'text': 'Moderately helpful', 'score': 7},
          {'text': 'Slightly helpful', 'score': 4},
          {'text': 'Not helpful at all', 'score': 1}
        ]
      },
      {
        'questiontext':
            "How effective was the translation service for translating signboards, menu cards, and speech?",
        'answers': [
          {'text': 'Very effective', 'score': 10},
          {'text': 'Somewhat effective', 'score': 7},
          {'text': 'Not very effective', 'score': 4},
          {'text': 'Not effective at all', 'score': 1}
        ]
      },
      {
        'questiontext':
            "How easy was it to track expenses and settle bills among group members using the built-in expense tracker?",
        'answers': [
          {'text': 'Very easy', 'score': 10},
          {'text': 'Somewhat easy', 'score': 7},
          {'text': 'Not very easy', 'score': 4},
          {'text': 'Not easy at all', 'score': 1}
        ]
      },
      {
        'questiontext':
            "Did the currency conversion feature help you manage your finances while traveling abroad?",
        'answers': [
          {'text': 'Yes, it was very helpful', 'score': 10},
          {'text': 'It was somewhat helpful', 'score': 7},
          {'text': 'Not very helpful', 'score': 4},
          {'text': 'Not helpful at all', 'score': 1}
        ]
      },
      {
        'questiontext':
            "Were the personalized recommendations for accommodations, attractions, and restaurants based on your preferences useful?",
        'answers': [
          {'text': 'Extremely useful', 'score': 10},
          {'text': 'Moderately useful', 'score': 7},
          {'text': 'Slightly useful', 'score': 4},
          {'text': 'Not useful at all', 'score': 1}
        ]
      },
      {
        'questiontext':
            "How well did the app perform in offline mode with limited connectivity?",
        'answers': [
          {'text': 'Worked perfectly offline', 'score': 10},
          {'text': 'Worked somewhat well offline', 'score': 7},
          {'text': 'Had limited functionality in offline mode', 'score': 4},
          {'text': 'Did not work offline at all', 'score': 1}
        ]
      },
      {
        'questiontext':
            "How secure and user-friendly did you find the user authentication process?",
        'answers': [
          {'text': 'Very secure and user-friendly', 'score': 10},
          {'text': 'Moderately secure and user-friendly', 'score': 7},
          {'text': 'Not very secure and user-friendly', 'score': 4},
          {'text': 'Not secure and user-friendly at all', 'score': 1}
        ]
      },
    ];

// This is a function called resetQuiz, which resets the quiz by setting questionIndex and
// total_score to 0. It calls the setState method to update the state of the app.
    void resetQuiz() {
      setState(() {
        questionIndex = 0;
        total_score = 0;
      });
    }

// This is a function called answerQuestions, which updates the total_score based on the
// user's selected answer and increments the questionIndex to move to the next question.
// It also checks if there are more questions to display or if the quiz has been completed.
    void answerQuestions(int score) {
      total_score += score;
      setState(() {
        questionIndex = questionIndex + 1;
      });
      if (questionIndex < 2) {
      } else {}
    }

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: const Text("TravelGenie"),
        backgroundColor: Colors.black,
      ),
      body: questionIndex < questions.length
          ? Quiz(answerQuestions, questionIndex, questions)
          : Result(total_score, resetQuiz),
    ));
  }
}
