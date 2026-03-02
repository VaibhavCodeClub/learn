// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:learn/widgets/quiz_widget.dart';

class AnimalsTestPage extends StatelessWidget {
  const AnimalsTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuizWidget(
      title: 'Animals Test',
      allQuestions: [
        QuizQuestion(
          imageAsset: 'assets/images/animal/bear.svg',
          options: ['Bear', 'Lion', 'Tiger', 'Wolf'],
          correctAnswer: 'Bear',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/cat.svg',
          options: ['Dog', 'Cat', 'Rabbit', 'Mouse'],
          correctAnswer: 'Cat',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/cow.svg',
          options: ['Horse', 'Cow', 'Goat', 'Sheep'],
          correctAnswer: 'Cow',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/deer.svg',
          options: ['Deer', 'Horse', 'Zebra', 'Giraffe'],
          correctAnswer: 'Deer',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/dog.svg',
          options: ['Cat', 'Dog', 'Fox', 'Wolf'],
          correctAnswer: 'Dog',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/elephant.svg',
          options: ['Elephant', 'Rhino', 'Hippo', 'Bear'],
          correctAnswer: 'Elephant',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/fox.svg',
          options: ['Dog', 'Wolf', 'Fox', 'Cat'],
          correctAnswer: 'Fox',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/giraffe.svg',
          options: ['Giraffe', 'Deer', 'Horse', 'Zebra'],
          correctAnswer: 'Giraffe',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/goat.svg',
          options: ['Sheep', 'Goat', 'Deer', 'Cow'],
          correctAnswer: 'Goat',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/horse.svg',
          options: ['Horse', 'Zebra', 'Deer', 'Donkey'],
          correctAnswer: 'Horse',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/kangaroo.svg',
          options: ['Kangaroo', 'Rabbit', 'Deer', 'Squirrel'],
          correctAnswer: 'Kangaroo',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/lion.svg',
          options: ['Tiger', 'Lion', 'Leopard', 'Cheetah'],
          correctAnswer: 'Lion',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/monkey.svg',
          options: ['Monkey', 'Gorilla', 'Chimpanzee', 'Baboon'],
          correctAnswer: 'Monkey',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/pig.svg',
          options: ['Pig', 'Boar', 'Hippo', 'Rhino'],
          correctAnswer: 'Pig',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/rabbit.svg',
          options: ['Rabbit', 'Hare', 'Squirrel', 'Mouse'],
          correctAnswer: 'Rabbit',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/sheep.svg',
          options: ['Goat', 'Sheep', 'Lamb', 'Deer'],
          correctAnswer: 'Sheep',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/snake.svg',
          options: ['Snake', 'Lizard', 'Crocodile', 'Alligator'],
          correctAnswer: 'Snake',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/squirrel.svg',
          options: ['Squirrel', 'Chipmunk', 'Rabbit', 'Mouse'],
          correctAnswer: 'Squirrel',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/tiger.svg',
          options: ['Lion', 'Tiger', 'Leopard', 'Cheetah'],
          correctAnswer: 'Tiger',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/animal/zebra.svg',
          options: ['Horse', 'Donkey', 'Zebra', 'Deer'],
          correctAnswer: 'Zebra',
        ),
      ],
    );
  }
}
