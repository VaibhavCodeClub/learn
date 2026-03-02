// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:learn/widgets/quiz_widget.dart';

class PlanetsTestPage extends StatelessWidget {
  const PlanetsTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuizWidget(
      title: 'Planets Test',
      allQuestions: [
        QuizQuestion(
          imageAsset: 'assets/images/solar/mercury.svg',
          options: ['Mercury', 'Venus', 'Mars', 'Earth'],
          correctAnswer: 'Mercury',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/solar/venus.svg',
          options: ['Mercury', 'Venus', 'Mars', 'Earth'],
          correctAnswer: 'Venus',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/solar/earth.svg',
          options: ['Mars', 'Earth', 'Venus', 'Mercury'],
          correctAnswer: 'Earth',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/solar/mars.svg',
          options: ['Mars', 'Earth', 'Venus', 'Mercury'],
          correctAnswer: 'Mars',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/solar/jupiter.svg',
          options: ['Jupiter', 'Saturn', 'Uranus', 'Neptune'],
          correctAnswer: 'Jupiter',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/solar/saturn.svg',
          options: ['Jupiter', 'Saturn', 'Uranus', 'Neptune'],
          correctAnswer: 'Saturn',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/solar/uranus.svg',
          options: ['Neptune', 'Uranus', 'Saturn', 'Jupiter'],
          correctAnswer: 'Uranus',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/solar/neptune.svg',
          options: ['Neptune', 'Uranus', 'Saturn', 'Jupiter'],
          correctAnswer: 'Neptune',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/solar/sun.svg',
          options: ['Sun', 'Moon', 'Star', 'Comet'],
          correctAnswer: 'Sun',
        ),
      ],
    );
  }
}
