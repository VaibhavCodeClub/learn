// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BirdQuestion {
  final String imageAsset;
  final List<String> options;
  final String correctAnswer;

  BirdQuestion({
    required this.imageAsset,
    required this.options,
    required this.correctAnswer,
  });
}

class BirdsTestPage extends StatefulWidget {
  const BirdsTestPage({Key? key}) : super(key: key);

  @override
  _BirdsTestPageState createState() => _BirdsTestPageState();
}

class _BirdsTestPageState extends State<BirdsTestPage> {
  List<BirdQuestion> allQuestions = [
    BirdQuestion(
      imageAsset: 'assets/images/birds/duck.svg',
      options: ['Owl', 'Parrot', 'Pigeon', 'Duck'],
      correctAnswer: 'Duck',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/hen.svg',
      options: ['Maina', 'Ostrich', 'Hen', 'Parrot'],
      correctAnswer: 'Hen',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/maina.svg',
      options: ['Vulture', 'Maina', 'Eagle', 'Goose'],
      correctAnswer: 'Maina',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/pigeon.svg',
      options: ['Crow', 'Duck', 'Pigeon', 'Eagle'],
      correctAnswer: 'Pigeon',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/sparrow.svg',
      options: ['Goose', 'Hen', 'Sparrow', 'Koel'],
      correctAnswer: 'Sparrow',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/bagula.svg',
      options: ['Bagula', 'Bulbul', 'Crow', 'Duck'],
      correctAnswer: 'Bagula',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/bulbul.svg',
      options: ['Eagle', 'Goose', 'Bulbul', 'Hen'],
      correctAnswer: 'Bulbul',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/crow.svg',
      options: ['Koel', 'Maina', 'Crow', 'Ostrich'],
      correctAnswer: 'Crow',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/eagle.svg',
      options: ['Eagle', 'Sparrow', 'Swan', 'Vulture'],
      correctAnswer: 'Eagle',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/goose.svg',
      options: ['Crow', 'Goose', 'Hen', 'Koel'],
      correctAnswer: 'Goose',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/koel.svg',
      options: ['Pigeon', 'Koel', 'Sparrow', 'Swan'],
      correctAnswer: 'Koel',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/ostrich.svg',
      options: ['Duck', 'Ostrich', 'Owl', 'Parrot'],
      correctAnswer: 'Ostrich',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/owl.svg',
      options: ['Pigeon', 'Owl', 'Sparrow', 'Swan'],
      correctAnswer: 'Owl',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/parrot.svg',
      options: ['Vulture', 'Bagula', 'Parrot', 'Bulbul'],
      correctAnswer: 'Parrot',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/swan.svg',
      options: ['Maina', 'Ostrich', 'Swan', 'Owl'],
      correctAnswer: 'Swan',
    ),
    BirdQuestion(
      imageAsset: 'assets/images/birds/vulture.svg',
      options: ['Parrot', 'Pigeon', 'Vulture', 'Sparrow'],
      correctAnswer: 'Vulture',
    ),
  ];

  List<BirdQuestion> questions = [];
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
    questions = (List<BirdQuestion>.from(allQuestions)..shuffle()).take(5).toList();
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
    BirdQuestion currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Birds Test'),
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
