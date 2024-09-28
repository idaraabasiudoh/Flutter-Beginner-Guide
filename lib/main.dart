// Importing necessary Flutter packages and local files
import 'package:flutter/material.dart'; // Material package for UI components
import './quiz.dart'; // Custom widget for quiz logic
import './result.dart'; // Custom widget for showing quiz results

// The main function is the entry point of the application
void main() => runApp(MyApp()); // runApp() initializes the app by running MyApp

// MyApp is a StatefulWidget, meaning it can rebuild itself when the state changes
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // This method creates the mutable state (_MyAppState) associated with MyApp
    return _MyAppState();
  }
}

// _MyAppState holds the actual state of MyApp, allowing it to rebuild based on changes
class _MyAppState extends State<MyApp> {
  // Defining a list of questions and their corresponding answers
  // Each question has a text and a list of answers with associated scores
  final _questions = [
    {
      "questionText": "What's your favourite color?", // The question to display
      "answers": [
        {"text": "Blue", "score": 10}, // Answer option with a score
        {"text": "Green", "score": 9},
        {"text": "Red", "score": 8},
        {"text": "Yellow", "score": 7},
      ]
    },
    {
      "questionText": "What's your favourite animal?", // Another question
      "answers": [
        {"text": "Dog", "score": 10}, // Different answer options
        {"text": "Cat", "score": 9},
        {"text": "Parrot", "score": 8},
      ]
    },
    {
      "questionText": "What's your favourite food?", // A third question
      "answers": [
        {"text": "Beans", "score": 10},
        {"text": "Rice", "score": 9},
        {"text": "Garri", "score": 8},
        {"text": "Bread", "score": 7},
      ]
    },
  ];

  // Variable to track the current index of the question being displayed
  var _questionIndex = 0;

  // Variable to track the total score accumulated from answers
  var _totalScore = 0;

  // This method is called when the quiz is reset (after finishing)
  // It resets the quiz back to the initial state (first question and zero score)
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0; // Reset question index to 0
      _totalScore = 0; // Reset total score to 0
    });
  }

  // This method is triggered when an answer is selected
  // It increases the question index and updates the total score
  void _answerQuestion(int scoreIncrease) {
    setState(() {
      _questionIndex = _questionIndex + 1; // Move to the next question
      _totalScore +=
          scoreIncrease; // Add the score of the selected answer to total score
    });

    print(_totalScore); // Debug: print the updated total score
    print(_questionIndex); // Debug: print the current question index
  }

  // The build method is responsible for rendering the UI components
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        // The main widget for the app, which holds other UI components
        home: Scaffold(
            backgroundColor: Color.fromARGB(
                255, 0, 0, 0), // Setting the background color to black
            appBar: AppBar(
              backgroundColor: Color.fromARGB(255, 28, 27,
                  27), // Setting the app bar background to dark grey
              title: Text("My First App"), // App bar title
              centerTitle: true, // Center the title in the app bar
              foregroundColor: Color.fromRGBO(
                  255, 255, 255, 1), // Setting the app bar text color to white
            ),
            // The body of the scaffold contains the quiz or result based on questionIndex
            body: _questionIndex < _questions.length
                // If there are still questions, display the Quiz widget
                ? Quiz(
                    answerQuestion:
                        _answerQuestion, // Pass the answer question function
                    questions: _questions, // Pass the questions list
                    questionIndex:
                        _questionIndex) // Pass the current question index
                // If all questions are answered, show the Result widget
                : Result(_totalScore,
                    _resetQuiz) // Show the result with the total score and reset function
            ));
  }
}
