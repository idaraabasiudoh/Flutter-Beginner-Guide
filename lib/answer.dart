import 'package:flutter/material.dart'; // Import Flutter material package

// Answer is a StatelessWidget, meaning it doesn't maintain state.
class Answer extends StatelessWidget {
  final VoidCallback selectHandler; // Callback function for button press.
  final String
      answerText; // The text of the answer to be displayed on the button.

  // Constructor to initialize the Answer widget with the selectHandler and answerText.
  Answer(
    this.selectHandler,
    this.answerText,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150, // Set the width of the button.
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white, // Button background color.
          foregroundColor: Colors.black, // Button text color.
          elevation: 50, // Adds a shadow effect.
        ),
        onPressed:
            selectHandler, // Calls the provided function when the button is pressed.
        child: Text(
          answerText, // Displays the answer text.
          style: TextStyle(color: Colors.black), // Sets text color to black.
        ),
      ),
    );
  }
}
