// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OccupationQuestion {
  final String imageAsset;
  final List<String> options;
  final String correctAnswer;

  OccupationQuestion({
    required this.imageAsset,
    required this.options,
    required this.correctAnswer,
  });
}

class OccupationsTestPage extends StatefulWidget {
  const OccupationsTestPage({Key? key}) : super(key: key);

  @override
  _OccupationsTestPageState createState() => _OccupationsTestPageState();
}

class _OccupationsTestPageState extends State<OccupationsTestPage> {
  List<List<OccupationQuestion>> questionSets = [
    [
      OccupationQuestion(
        imageAsset: 'assets/images/occupations/artist.svg',
        options: ['Artist', 'Author', 'Carpenter', 'Electrician'],
        correctAnswer: 'Artist',
      ),
      OccupationQuestion(
        imageAsset: 'assets/images/occupations/engineer.svg',
        options: ['Engineer', 'Pilot', 'Farmer', 'Lawyer'],
        correctAnswer: 'Engineer',
      ),
      OccupationQuestion(
        imageAsset: 'assets/images/occupations/farmer.svg',
        options: ['Teacher', 'Vet', 'Farmer', 'Photographer'],
        correctAnswer: 'Farmer',
      ),
      OccupationQuestion(
        imageAsset: 'assets/images/occupations/police.svg',
        options: ['Engineer', 'Pilot', 'Police', 'Barber'],
        correctAnswer: 'Police',
      ),
      OccupationQuestion(
        imageAsset: 'assets/images/occupations/teacher.svg',
        options: ['Teacher', 'Vet', 'Photographer', 'Author'],
        correctAnswer: 'Teacher',
      ),
    ],
    [
      OccupationQuestion(
        imageAsset: 'assets/images/occupations/author.svg',
        options: ['Pilot', 'Police', 'Teacher', 'Author'],
        correctAnswer: 'Author',
      ),
      OccupationQuestion(
        imageAsset: 'assets/images/occupations/carpenter.svg',
        options: ['Farmer', 'Engineer', 'Carpenter', 'Vet'],
        correctAnswer: 'Carpenter',
      ),
      OccupationQuestion(
        imageAsset: 'assets/images/occupations/electrician.svg',
        options: ['Engineer', 'Electrician', 'Farmer', 'Teacher'],
        correctAnswer: 'Electrician',
      ),
      OccupationQuestion(
        imageAsset: 'assets/images/occupations/vet.svg',
        options: ['Engineer', 'Lawyer', 'Vet', 'Author'],
        correctAnswer: 'Vet',
      ),
      OccupationQuestion(
        imageAsset: 'assets/images/occupations/photographer.svg',
        options: ['Pilot', 'Photographer', 'Carpenter', 'Barber'],
        correctAnswer: 'Photographer',
      ),
      OccupationQuestion(
      imageAsset: 'assets/images/occupations/photographer.svg',
      options: ['Pilot', 'Photographer', 'Carpenter', 'Barber'],
      correctAnswer: 'Photographer',
    ),
    OccupationQuestion(
      imageAsset: 'assets/images/occupations/lawyer.svg',
      options: ['Lawyer', 'Carpenter', 'Electrician', 'Farmer'],
      correctAnswer: 'Lawyer',
    ),
    OccupationQuestion(
      imageAsset: 'assets/images/occupations/barber.svg',
      options: ['Teacher', 'Barber', 'Vet', 'Author'],
      correctAnswer: 'Barber',
    ),
    ],
    
  ];

  int currentQuestionSetIndex = 0;
  int currentQuestionIndex = 0;
  int correctAnswers = 0;
  bool showFeedback = false;
  bool isCorrect = false;

  @override
  void initState() {
    super.initState();
    _shuffleQuestions();
  }

  void _shuffleQuestions() {
    for (var questionSet in questionSets) {
      questionSet.shuffle();
    }
  }

  void _checkAnswer(String answer) {
    setState(() {
      isCorrect = questionSets[currentQuestionSetIndex][currentQuestionIndex].correctAnswer == answer;
      if (isCorrect) {
        correctAnswers++;
      }
      showFeedback = true;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex < questionSets[currentQuestionSetIndex].length - 1) {
        currentQuestionIndex++;
        showFeedback = false;
      } else {
        if (currentQuestionSetIndex < questionSets.length - 1) {
          currentQuestionSetIndex++;
          currentQuestionIndex = 0;
        } else {
          showFeedback = false;
          _showFinalScore(context);
          return;
        }
      }
    });
  }

  void _restartQuiz() {
    setState(() {
      currentQuestionSetIndex = 0;
      currentQuestionIndex = 0;
      correctAnswers = 0;
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
            'You got $correctAnswers out of ${questionSets[currentQuestionSetIndex].length} correct!',
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
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    OccupationQuestion currentQuestion = questionSets[currentQuestionSetIndex][currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Occupations Test'),
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
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6.0),
                  child: GestureDetector(
                    onTap: () => _checkAnswer(option),
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

