// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnimalQuestion {
  final String imageAsset;
  final List<String> options;
  final String correctAnswer;

  AnimalQuestion({
    required this.imageAsset,
    required this.options,
    required this.correctAnswer,
  });
}

class AnimalsTestPage extends StatefulWidget {
  const AnimalsTestPage({Key? key}) : super(key: key);

  @override
  _AnimalsTestPageState createState() => _AnimalsTestPageState();
}

class _AnimalsTestPageState extends State<AnimalsTestPage> {
  List<AnimalQuestion> allQuestions = [
    AnimalQuestion(
      imageAsset: 'assets/images/animal/lion.svg',
      options: ['Lion', 'Tiger', 'Leopard', 'Cheetah'],
      correctAnswer: 'Lion',
    ),
    AnimalQuestion(
      imageAsset: 'assets/images/animal/elephant.svg',
      options: ['Rhino', 'Hippo', 'Elephant', 'Giraffe'],
      correctAnswer: 'Elephant',
    ),
    AnimalQuestion(
      imageAsset: 'assets/images/animal/cat.svg',
      options: ['Dog', 'Cat', 'Rabbit', 'Squirrel'],
      correctAnswer: 'Cat',
    ),
    AnimalQuestion(
      imageAsset: 'assets/images/animal/deer.svg',
      options: ['Deer', 'Moose', 'Antelope', 'Elk'],
      correctAnswer: 'Deer',
    ),
    AnimalQuestion(
      imageAsset: 'assets/images/animal/dog.svg',
      options: ['Wolf', 'Dog', 'Fox', 'Coyote'],
      correctAnswer: 'Dog',
    ),
    AnimalQuestion(
      imageAsset: 'assets/images/animal/fox.svg',
      options: ['Wolf', 'Dog', 'Coyote', 'Fox'],
      correctAnswer: 'Fox',
    ),
    AnimalQuestion(
      imageAsset: 'assets/images/animal/giraffe.svg',
      options: ['Giraffe', 'Elephant', 'Zebra', 'Camel'],
      correctAnswer: 'Giraffe',
    ),
    AnimalQuestion(
      imageAsset: 'assets/images/animal/monkey.svg',
      options: ['Gorilla', 'Chimpanzee', 'Monkey', 'Baboon'],
      correctAnswer: 'Monkey',
    ),
    AnimalQuestion(
      imageAsset: 'assets/images/animal/pig.svg',
      options: ['Pig', 'Boar', 'Hog', 'Warthog'],
      correctAnswer: 'Pig',
    ),
    AnimalQuestion(
      imageAsset: 'assets/images/animal/rabbit.svg',
      options: ['Hare', 'Squirrel', 'Guinea Pig', 'Rabbit'],
      correctAnswer: 'Rabbit',
    ),
    AnimalQuestion(
      imageAsset: 'assets/images/animal/bear.svg',
      options: ['Wolf', 'Fox', 'Bear', 'Dog'],
      correctAnswer: 'Bear',
    ),
    AnimalQuestion(
      imageAsset: 'assets/images/animal/cow.svg',
      options: ['Goat', 'Sheep', 'Buffalo', 'Cow'],
      correctAnswer: 'Cow',
    ),
  ];

  List<AnimalQuestion> questions = [];
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
    questions = (List<AnimalQuestion>.from(allQuestions)..shuffle()).take(5).toList();
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
    AnimalQuestion currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Animals Test'),
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
