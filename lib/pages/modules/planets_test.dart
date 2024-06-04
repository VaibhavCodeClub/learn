// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PlanetQuestion {
  final String imageAsset;
  final List<String> options;
  final String correctAnswer;

  PlanetQuestion({
    required this.imageAsset,
    required this.options,
    required this.correctAnswer,
  });
}

class PlanetsTestPage extends StatefulWidget {
  const PlanetsTestPage({Key? key}) : super(key: key);

  @override
  _PlanetsTestPageState createState() => _PlanetsTestPageState();
}

class _PlanetsTestPageState extends State<PlanetsTestPage> {
  List<PlanetQuestion> allQuestions = [
    PlanetQuestion(
      imageAsset: 'assets/images/solar/earth.svg',
      options: ['Earth', 'Mars', 'Jupiter', 'Neptune'],
      correctAnswer: 'Earth',
    ),
    PlanetQuestion(
      imageAsset: 'assets/images/solar/mars.svg',
      options: ['Mercury', 'Mars', 'Saturn', 'Jupiter'],
      correctAnswer: 'Mars',
    ),
    PlanetQuestion(
      imageAsset: 'assets/images/solar/jupiter.svg',
      options: ['Saturn', 'Uranus', 'Jupiter', 'Neptune'],
      correctAnswer: 'Jupiter',
    ),
    PlanetQuestion(
      imageAsset: 'assets/images/solar/neptune.svg',
      options: ['Neptune', 'Mercury', 'Venus', 'Uranus'],
      correctAnswer: 'Neptune',
    ),
    PlanetQuestion(
      imageAsset: 'assets/images/solar/sun.svg',
      options: ['Venus', 'Earth', 'Mercury', 'Sun'],
      correctAnswer: 'Sun',
    ),
    PlanetQuestion(
      imageAsset: 'assets/images/solar/venus.svg',
      options: ['Mars', 'Venus', 'Uranus', 'Neptune'],
      correctAnswer: 'Venus',
    ),
    PlanetQuestion(
      imageAsset: 'assets/images/solar/uranus.svg',
      options: ['Saturn', 'Jupiter', 'Neptune', 'Uranus'],
      correctAnswer: 'Uranus',
    ),
    PlanetQuestion(
      imageAsset: 'assets/images/solar/mercury.svg',
      options: ['Venus', 'Mercury', 'Sun', 'Earth'],
      correctAnswer: 'Mercury',
    ),
    PlanetQuestion(
      imageAsset: 'assets/images/solar/saturn.svg',
      options: ['Jupiter', 'Mars', 'Saturn', 'Sun'],
      correctAnswer: 'Saturn',
    ),
  ];

  List<PlanetQuestion> questions = [];
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  bool showFeedback = false;
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    _restartQuiz();
  }

  void _shuffleQuestions() {
    questions = (List<PlanetQuestion>.from(allQuestions)..shuffle()).take(5).toList();
  }

  void _checkAnswer(String answer) {
    setState(() {
      isCorrect = questions[currentQuestionIndex].correctAnswer == answer;
      if (isCorrect) {
        correctAnswers++;
      }
      showFeedback = true;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
        showFeedback = false;
      } else {
        showFeedback = false;
        _showFinalScore(context);
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      currentQuestionIndex = 0;
      correctAnswers = 0;
      showFeedback = false;
      _shuffleQuestions();
    });
  }

  void _showFinalScore(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Quiz Completed'),
          content: Text(
            'You got $correctAnswers out of ${questions.length} correct!',
            style: const TextStyle(fontSize: 20),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Restart'),
              onPressed: () {
                Navigator.of(context).pop();
                _restartQuiz();
              },
            ),
            TextButton(
              child: const Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    PlanetQuestion currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Planets Test'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.amberAccent,
                ),
                child: SvgPicture.asset(
                  currentQuestion.imageAsset,
                ),
              ),
              const SizedBox(height: 20),
              ...currentQuestion.options.map((option) {
                return GestureDetector(
                  onTap: () => _checkAnswer(option),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6.0),
                    child: Container(
                      width: 200,
                      height: 40,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                        borderRadius: BorderRadius.circular(1),
                        color: Colors.lightBlueAccent,
                      ),
                      child: Center(
                        child: Text(option, style: const TextStyle(fontSize: 18)),
                      ),
                    ),
                  ),
                );
              }).toList(),
              if (showFeedback)
                Text(
                  isCorrect ? 'Correct!' : 'Wrong!',
                  style: TextStyle(
                    color: isCorrect ? Colors.green : Colors.red,
                    fontSize: 24,
                  ),
                ),
              if (showFeedback)
                ElevatedButton(
                  onPressed: _nextQuestion,
                  child: const Text('Next'),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
