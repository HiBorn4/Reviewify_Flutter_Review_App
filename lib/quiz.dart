// imports the Flutter Material package, which provides widgets and tools for building
// material design applications.
import "package:flutter/material.dart";
// imports the Answer widget from a separate file named "answer.dart".
import 'answer.dart';
// imports the Question widget from a separate file named "question.dart".
import 'question.dart';

// Defining a Quiz class which extends the StatelessWidget class. This class has three
// required arguments: answerQuestions, questionIndex, and questions, which are all of type
// Function or List. The optional argument key is also passed to the superclass constructor.
class Quiz extends StatelessWidget {
//  declares a final variable called answerQuestions which is a function that takes an
// integer parameter and returns void.
  final void Function(int)
      answerQuestions; // a function that takes an int parameter and returns void
//  declares a final variable called questionIndex of type int, which represents the current
// index of the question being displayed.
  final int questionIndex; // an int representing the current question index
// declares a final variable called questions of type List<Map<String, Object>>, which
// represents the list of questions and answers for the quiz.
  final List<Map<String, Object>>
      questions; // a list of maps, each map contains a question and its answers

  const Quiz(this.answerQuestions, this.questionIndex, this.questions,
      {Key? key})
      : super(key: key);

// Question is a custom widget which is being called with a string argument to display the
// current question on the screen.
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            Question(
              questions[questionIndex]['questiontext'].toString(),
            ),
          ],
        ),
        // This section is using the spread operator ... to expand the contents of the List of answers
        // returned by .map() into the Column children. The .map() method applies the given function
        // to each item of the list. Here, it maps the List<Map<String, Object>> of answers to a List
        // of Answer widgets. Each Answer widget is given a callback function that takes an integer
        // argument, and the answer text to display on the button.
        Column(
          children: [
            ...(questions[questionIndex]['answers']
                    as List<Map<String, Object>>)
                .map((answer) {
              return Answer(
                () => answerQuestions(answer['score'] as int),
                answer['text'].toString(),
              );
            }).toList(),
          ],
        ),
      ],
    );
  }
}
// Returning a Column widget with the Question widget and a list of Answer widgets as its
// children. The build() method is required for all widgets in Flutter, and it must return
// a widget.