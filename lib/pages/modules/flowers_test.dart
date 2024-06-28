// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FlowerQuestion {
  final String imageAsset;
  final List<String> options;
  final String correctAnswer;

  FlowerQuestion({
    required this.imageAsset,
    required this.options,
    required this.correctAnswer,
  });
}

class FlowersTestPage extends StatefulWidget {
  const FlowersTestPage({Key? key}) : super(key: key);

  @override
  _FlowersTestPageState createState() => _FlowersTestPageState();
}

class _FlowersTestPageState extends State<FlowersTestPage> {
  List<FlowerQuestion> allQuestions = [
    FlowerQuestion(
      imageAsset: 'assets/images/flowers/carnation.svg',
      options: ['Carnation', 'Daffodil', 'Daisy', 'Hibiscus'],
      correctAnswer: 'Carnation',
    ),
    FlowerQuestion(
      imageAsset: 'assets/images/flowers/daffodil.svg',
      options: ['Lavender', 'Lily', 'Marigold', 'Daffodil'],
      correctAnswer: 'Daffodil',
    ),
    FlowerQuestion(
      imageAsset: 'assets/images/flowers/lily.svg',
      options: ['Lily', 'Carnation', 'Sunflower', 'Marigold'],
      correctAnswer: 'Lily',
    ),
    FlowerQuestion(
      imageAsset: 'assets/images/flowers/rose.svg',
      options: ['Tulip', 'Poppy', 'Rose', 'Hibiscus'],
      correctAnswer: 'Rose',
    ),
    FlowerQuestion(
      imageAsset: 'assets/images/flowers/sunflower.svg',
      options: ['Sunflower', 'Hibiscus', 'Lavender', 'Daisy'],
      correctAnswer: 'Sunflower',
    ),
    FlowerQuestion(
      imageAsset: 'assets/images/flowers/daisy.svg',
      options: ['Poppy', 'Tulip', 'Sunflower', 'Daisy'],
      correctAnswer: 'Daisy',
    ),
    FlowerQuestion(
      imageAsset: 'assets/images/flowers/hibiscus.svg',
      options: ['Carnation', 'Daffodil', 'Hibiscus', 'Lavender'],
      correctAnswer: 'Hibiscus',
    ),
    FlowerQuestion(
      imageAsset: 'assets/images/flowers/lavender.svg',
      options: ['Lily', 'Lavender', 'Marigold', 'Rose'],
      correctAnswer: 'Lavender',
    ),
    FlowerQuestion(
      imageAsset: 'assets/images/flowers/marigold.svg',
      options: ['Rose', 'Marigold', 'Daisy', 'Sunflower'],
      correctAnswer: 'Marigold',
    ),
    FlowerQuestion(
      imageAsset: 'assets/images/flowers/poppy.svg',
      options: ['Poppy', 'Carnation', 'Sunflower', 'Daffodil'],
      correctAnswer: 'Poppy',
    ),
    FlowerQuestion(
      imageAsset: 'assets/images/flowers/tulip.svg',
      options: ['Lily', 'Tulip', 'Marigold', 'Sunflower'],
      correctAnswer: 'Tulip',
    ),
  ];

  List<FlowerQuestion> questions = [];
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
    questions = (List<FlowerQuestion>.from(allQuestions)..shuffle()).take(5).toList();
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
    FlowerQuestion currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flowers Test'),
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
