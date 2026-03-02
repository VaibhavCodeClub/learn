// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:learn/widgets/quiz_widget.dart';

class BirdsTestPage extends StatelessWidget {
  const BirdsTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuizWidget(
      title: 'Birds Test',
      allQuestions: [
        QuizQuestion(
          imageAsset: 'assets/images/birds/Duck.svg',
          options: ['Owl', 'Parrot', 'Pigeon', 'Duck'],
          correctAnswer: 'Duck',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Hen.svg',
          options: ['Maina', 'Ostrich', 'Hen', 'Parrot'],
          correctAnswer: 'Hen',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Maina.svg',
          options: ['Vulture', 'Maina', 'Eagle', 'Goose'],
          correctAnswer: 'Maina',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Pigeon.svg',
          options: ['Crow', 'Duck', 'Pigeon', 'Eagle'],
          correctAnswer: 'Pigeon',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Sparrow.svg',
          options: ['Goose', 'Hen', 'Sparrow', 'Koel'],
          correctAnswer: 'Sparrow',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Bagula.svg',
          options: ['Bagula', 'Bulbul', 'Crow', 'Duck'],
          correctAnswer: 'Bagula',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Bulbul.svg',
          options: ['Eagle', 'Goose', 'Bulbul', 'Hen'],
          correctAnswer: 'Bulbul',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Crow.svg',
          options: ['Koel', 'Maina', 'Crow', 'Ostrich'],
          correctAnswer: 'Crow',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Eagle.svg',
          options: ['Eagle', 'Sparrow', 'Swan', 'Vulture'],
          correctAnswer: 'Eagle',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Goose.svg',
          options: ['Crow', 'Goose', 'Hen', 'Koel'],
          correctAnswer: 'Goose',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Koel.svg',
          options: ['Pigeon', 'Koel', 'Sparrow', 'Swan'],
          correctAnswer: 'Koel',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Ostrich.svg',
          options: ['Duck', 'Ostrich', 'Owl', 'Parrot'],
          correctAnswer: 'Ostrich',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Owl.svg',
          options: ['Pigeon', 'Owl', 'Sparrow', 'Swan'],
          correctAnswer: 'Owl',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Parrot.svg',
          options: ['Vulture', 'Bagula', 'Parrot', 'Bulbul'],
          correctAnswer: 'Parrot',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Swan.svg',
          options: ['Maina', 'Ostrich', 'Swan', 'Owl'],
          correctAnswer: 'Swan',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/birds/Vulture.svg',
          options: ['Parrot', 'Pigeon', 'Vulture', 'Sparrow'],
          correctAnswer: 'Vulture',
        ),
      ],
    );
  }
}
