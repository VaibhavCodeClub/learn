// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PartQuestion {
  final String imageAsset;
  final List<String> options;
  final String correctAnswer;

  PartQuestion({
    required this.imageAsset,
    required this.options,
    required this.correctAnswer,
  });
}

class PartsTestPage extends StatefulWidget {
  const PartsTestPage({Key? key}) : super(key: key);

  @override
  _PartsTestPageState createState() => _PartsTestPageState();
}

class _PartsTestPageState extends State<PartsTestPage> {
  List<PartQuestion> allQuestions = [
    // Define all PartQuestion objects here
    PartQuestion(
      imageAsset: 'assets/images/body/arm.svg',
      options: ['Ankle', 'Back', 'Arm', 'Belly'],
      correctAnswer: 'Arm',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/eye.svg',
      options: ['Ear', 'Eye', 'Nose', 'Mouth'],
      correctAnswer: 'Eye',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/foot.svg',
      options: ['Hand', 'Fingers', 'Toes', 'Foot'],
      correctAnswer: 'Foot',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/nose.svg',
      options: ['Nose', 'Mouth', 'Ear', 'Eye'],
      correctAnswer: 'Nose',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/tongue.svg',
      options: ['Teeth', 'Lips', 'Tongue', 'Mouth'],
      correctAnswer: 'Tongue',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/ankle.svg',
      options: ['Ankle', 'Arm', 'Back', 'Belly'],
      correctAnswer: 'Ankle',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/back.svg',
      options: ['Back', 'Ankle', 'Arm', 'Belly'],
      correctAnswer: 'Back',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/belly.svg',
      options: ['Belly', 'Ankle', 'Arm', 'Back'],
      correctAnswer: 'Belly',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/ear.svg',
      options: ['Ear', 'Eye', 'Nose', 'Mouth'],
      correctAnswer: 'Ear',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/chest.svg',
      options: ['Chest', 'Back', 'Stomach', 'Neck'],
      correctAnswer: 'Chest',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/chin.svg',
      options: ['Chin', 'Jaw', 'Lips', 'Nose'],
      correctAnswer: 'Chin',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/fingers.svg',
      options: ['Fingers', 'Toes', 'Hand', 'Feet'],
      correctAnswer: 'Fingers',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/lips.svg',
      options: ['Lips', 'Nose', 'Chin', 'Teeth'],
      correctAnswer: 'Lips',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/knee.svg',
      options: ['Knee', 'Ankle', 'Leg', 'Elbow'],
      correctAnswer: 'Knee',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/hips.svg',
      options: ['Hips', 'Waist', 'Legs', 'Thighs'],
      correctAnswer: 'Hips',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/stomach.svg',
      options: ['Stomach', 'Chest', 'Back', 'Neck'],
      correctAnswer: 'Stomach',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/neck.svg',
      options: ['Neck', 'Shoulder', 'Head', 'Chest'],
      correctAnswer: 'Neck',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/teeth.svg',
      options: ['Teeth', 'Tongue', 'Lips', 'Mouth'],
      correctAnswer: 'Teeth',
    ),
    PartQuestion(
      imageAsset: 'assets/images/body/wrist.svg',
      options: ['Wrist', 'Elbow', 'Arm', 'Hand'],
      correctAnswer: 'Wrist',
    ),
  ];

  List<PartQuestion> questions = [];
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
    questions = (List<PartQuestion>.from(allQuestions)..shuffle()).take(5).toList();
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
    PartQuestion currentQuestion = questions[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Parts Test'),
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
