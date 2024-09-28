import 'package:flutter/material.dart'; // Import Flutter material package.

// Result is a StatelessWidget that displays the quiz results and a restart button.
class Result extends StatelessWidget {
  final int finalScore; // The final score obtained in the quiz.
  final VoidCallback resetHandler; // Callback to reset the quiz.

  // Constructor to initialize the Result widget with the final score and reset handler.
  Result(this.finalScore, this.resetHandler);

  // Getter to return a result string based on the final score.
  String get scoreString {
    var resultText =
        "Personality check successfully complete\nScore: $finalScore/30";
    if (finalScore >= 27) {
      resultText += "\n\nHIGH Match";
    } else if (finalScore >= 25 && finalScore <= 26) {
      resultText += "\n\nAVERAGE Match";
    } else {
      resultText += "\n\nPOOR Match";
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // Display the result text.
          Text(
            scoreString,
            style: TextStyle(
                color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          // Button to restart the quiz.
          ElevatedButton(
              onPressed: resetHandler,
              child: Text(
                "Restart Quiz",
                style: TextStyle(color: Colors.black),
              ))
        ],
      ),
    );
  }
}
