// Importing necessary packages.
import 'package:flutter/material.dart';

// Defining an Answer class which extends the StatelessWidget class. This class has two
// required arguments: selectHandler, a callback function to execute when the button is
// pressed, and answertext, the text to display on the button. The optional argument key
// is passed to the superclass constructor.
class Answer extends StatelessWidget {
  final VoidCallback selectHandler;
  final String answertext;
  const Answer(this.selectHandler, this.answertext, {super.key});
// Defining the build() method to return a SizedBox with a width of double.infinity
// (i.e., the button should be as wide as its parent container). The ElevatedButton widget
// is used to create the button, and its onPressed argument is set to the selectHandler
// callback function. The style argument is set to create a custom look for the button
// using ElevatedButton.styleFrom(), which takes two arguments: foregroundColor and
// backgroundColor. These arguments blend two colors to create a gradient effect for both
// the text and the button background. Finally, the child argument is set to display the
// answertext string in the button.
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: SizedBox(
        // width: double.infinity,
        // color: Colors.black87,
        child: ElevatedButton(
          onPressed: selectHandler,
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: Colors.black.withOpacity(0.8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(1000000000),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          ),
          child: Text(answertext),
        ),
      ),
    );
  }
}
