import 'package:flutter/material.dart'; // Import Flutter material package.
import './answer.dart'; // Import the custom Answer widget.
import './question.dart'; // Import the custom Question widget.

// Quiz is a StatelessWidget that handles displaying questions and answers.
class Quiz extends StatelessWidget {
  final Function
      answerQuestion; // Callback function when an answer is selected.
  final List<Map<String, Object>> questions; // List of questions and answers.
  final int questionIndex; // Index of the current question.

  // Constructor to initialize the Quiz widget with the necessary data.
  const Quiz({
    super.key,
    required this.answerQuestion, // Answer callback function.
    required this.questions, // Questions list.
    required this.questionIndex, // Current question index.
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Display the current question.
        Question(questions[questionIndex]["questionText"] as String),
        // Map over the answers and create an Answer widget for each one.
        ...(questions[questionIndex]["answers"] as List<Map<String, Object>>)
            .map((answer) {
          return Answer(
              () => answerQuestion(answer["score"]), answer["text"] as String);
        }).toList(), // Display answers dynamically as buttons.
      ],
    );
  }
}
