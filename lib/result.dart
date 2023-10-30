// This code defines a stateless widget called Result. It is used to display the result of
// the quiz taken in the app.
// Importing the material library from the Flutter framework.
import 'package:flutter/material.dart';

// Declaring a new stateless widget called Result.
class Result extends StatelessWidget {
  // Declaring two instance variables, resultscore and resetQuiz. resultscore holds the total
  // score obtained by the user in the quiz, and resetQuiz is a callback function to restart
  // the quiz. The const Result constructor takes these two variables as arguments.
  final int resultscore;
  final VoidCallback resetQuiz;
  const Result(this.resultscore, this.resetQuiz, {super.key});

// This build method returns the layout of the widget. It displays the result phrase calculated
// by resultPhrase in a Text widget with a specified style. It also displays a TextButton widget
// to restart the quiz when clicked. The layout is centered using the Center widget, and the
// widgets are placed in a Column widget.
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          const Text(
            "Thank You For Your Response",
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(
            onPressed: resetQuiz,
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.black.withOpacity(0.8),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            ),
            child: const Text("Reconsider Your Review"),
          )
        ],
      ),
    );
  }
}
