import 'package:flutter/material.dart'; // Import Flutter material package.

// Question is a StatelessWidget that displays the question text.
class Question extends StatelessWidget {
  final String questionText; // The text of the question to display.

  // Constructor to initialize the Question widget with the question text.
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double
          .infinity, // Makes the container span the full width of the screen.
      margin: EdgeInsets.all(10), // Adds margin around the container.
      child: Text(
        questionText, // Displays the question text.
        style: TextStyle(
          fontSize: 28,
          color: Colors.white,
        ), // Sets the font size of the text.
        textAlign: TextAlign.center, // Centers the text.
      ),
    );
  }
}
