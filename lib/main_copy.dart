// This imports the Flutter Material package and two custom widgets named Question and Answer.
// It also defines the main function which runs the MyApp widget.
import 'package:flutter/material.dart';
import "./question.dart";
import "./answer.dart";

void main() => runApp(const MyApp());

// _ Convention of privating
// This defines a stateful widget MyApp which has mutable state.
// createState() method returns an instance of _MyAppState.
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

// This defines the state for MyApp which is private and can only be accessed within the class
// _MyAppState.
// questionIndex keeps track of the current question index.
// answerQuestions is a method that increments the questionIndex state by 1 and calls setState()
// method to update the UI.
class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  void answerQuestions() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
  }

// build method returns the UI of the widget.
// questions is a list of maps, which stores questions and their respective answers.
  @override
  Widget build(BuildContext context) {
    const questions = [
      {
        'questiontext': "What 's your favourite places?",
        'answers': ['Black', 'Red', 'Green', 'Blue'],
      },
      {
        'questiontext': "What 's your favourite animal?",
        'answers': ['Lion', 'Cheetah', 'Shark', 'Panther'],
      },
      {
        'questiontext': "Who 's your favourite food?",
        'answers': ['Continental', 'Pizza', 'Local', 'Burger'],
      }
    ];
// This is the main UI for the app.
// MaterialApp is a wrapper widget for the entire app.
// Scaffold is a widget for creating the basic material design visual layout structure.
// AppBar is a widget for creating the top app bar.
// Question widget displays the current question text by accessing it from the questions list.
// The ... operator spreads the list of answers returned by the map function into separate widgets created using the Answer widget.
// answerQuestions is passed as a callback function to the Answer widget which updates the state when an answer is selected.
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: const Text("Travel App"),
            backgroundColor: const Color.fromARGB(255, 255, 37, 37)),
        body: Column(children: [
          Question(
            questions[questionIndex % 3]['questiontext'].toString(),
          ),
          // Text(questions.elementAt(0)),
          // ElevatedButton(
          //   onPressed: answerQuestions,
          //   child: Text("Answer 1")
          //   ),
          ...(questions[questionIndex % 3]['answers'] as List<String>)
              .map((answer) {
            return Answer(answerQuestions, answer);
          }).toList()
          // Answer(answerQuestions),
          // ElevatedButton(
          //   onPressed: answerQuestions,
          //   // onPressed: () => print("Answer 2 Choosen !"),
          //   child: Text("Answer 2")
          //   ),
          // Answer(answerQuestions),
          // ElevatedButton(
          //   // onPressed: () {
          //   //   print("Answer 3 Choosen !");
          //   // },
          //   onPressed: answerQuestions,
          //   child: Text("Answer 3")
          //   ),
          // Answer(answerQuestions)
        ]),
      ),
    );
  }
}
