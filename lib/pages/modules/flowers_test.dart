// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:learn/widgets/quiz_widget.dart';

class FlowersTestPage extends StatelessWidget {
  const FlowersTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuizWidget(
      title: 'Flowers Test',
      allQuestions: [
        QuizQuestion(
          imageAsset: 'assets/images/flowers/rose.svg',
          options: ['Lily', 'Rose', 'Tulip', 'Daisy'],
          correctAnswer: 'Rose',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/sunflower.svg',
          options: ['Sunflower', 'Daisy', 'Marigold', 'Dandelion'],
          correctAnswer: 'Sunflower',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/tulip.svg',
          options: ['Rose', 'Tulip', 'Lily', 'Lotus'],
          correctAnswer: 'Tulip',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/lily.svg',
          options: ['Lily', 'Lotus', 'Rose', 'Tulip'],
          correctAnswer: 'Lily',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/lotus.svg',
          options: ['Lily', 'Lotus', 'Rose', 'Jasmine'],
          correctAnswer: 'Lotus',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/daisy.svg',
          options: ['Daisy', 'Sunflower', 'Marigold', 'Dandelion'],
          correctAnswer: 'Daisy',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/marigold.svg',
          options: ['Sunflower', 'Marigold', 'Daisy', 'Dandelion'],
          correctAnswer: 'Marigold',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/jasmine.svg',
          options: ['Jasmine', 'Lily', 'Rose', 'Lotus'],
          correctAnswer: 'Jasmine',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/hibiscus.svg',
          options: ['Hibiscus', 'Rose', 'Poppy', 'Carnation'],
          correctAnswer: 'Hibiscus',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/lavender.svg',
          options: ['Lavender', 'Jasmine', 'Lily', 'Lotus'],
          correctAnswer: 'Lavender',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/carnation.svg',
          options: ['Rose', 'Carnation', 'Poppy', 'Hibiscus'],
          correctAnswer: 'Carnation',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/daffodil.svg',
          options: ['Daffodil', 'Tulip', 'Lily', 'Daisy'],
          correctAnswer: 'Daffodil',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/dandelion.svg',
          options: ['Sunflower', 'Daisy', 'Dandelion', 'Marigold'],
          correctAnswer: 'Dandelion',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/flowers/poppy.svg',
          options: ['Rose', 'Poppy', 'Hibiscus', 'Carnation'],
          correctAnswer: 'Poppy',
        ),
      ],
    );
  }
}
