// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:learn/widgets/quiz_widget.dart';

class PartsTestPage extends StatelessWidget {
  const PartsTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuizWidget(
      title: 'Body Parts Test',
      allQuestions: [
        QuizQuestion(
          imageAsset: 'assets/images/body/Arm.svg',
          options: ['Ankle', 'Back', 'Arm', 'Belly'],
          correctAnswer: 'Arm',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Eye.svg',
          options: ['Ear', 'Eye', 'Nose', 'Mouth'],
          correctAnswer: 'Eye',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Foot.svg',
          options: ['Hand', 'Fingers', 'Toes', 'Foot'],
          correctAnswer: 'Foot',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Nose.svg',
          options: ['Nose', 'Mouth', 'Ear', 'Eye'],
          correctAnswer: 'Nose',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Tongue.svg',
          options: ['Teeth', 'Lips', 'Tongue', 'Mouth'],
          correctAnswer: 'Tongue',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Ankle.svg',
          options: ['Ankle', 'Arm', 'Back', 'Belly'],
          correctAnswer: 'Ankle',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Back.svg',
          options: ['Back', 'Ankle', 'Arm', 'Belly'],
          correctAnswer: 'Back',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Belly.svg',
          options: ['Belly', 'Ankle', 'Arm', 'Back'],
          correctAnswer: 'Belly',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Ear.svg',
          options: ['Ear', 'Eye', 'Nose', 'Mouth'],
          correctAnswer: 'Ear',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Chest.svg',
          options: ['Chest', 'Back', 'Stomach', 'Neck'],
          correctAnswer: 'Chest',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Chin.svg',
          options: ['Chin', 'Jaw', 'Lips', 'Nose'],
          correctAnswer: 'Chin',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Fingers.svg',
          options: ['Fingers', 'Toes', 'Hand', 'Feet'],
          correctAnswer: 'Fingers',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Lips.svg',
          options: ['Lips', 'Nose', 'Chin', 'Teeth'],
          correctAnswer: 'Lips',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Knee.svg',
          options: ['Knee', 'Ankle', 'Leg', 'Elbow'],
          correctAnswer: 'Knee',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Hips.svg',
          options: ['Hips', 'Waist', 'Legs', 'Thighs'],
          correctAnswer: 'Hips',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Stomach.svg',
          options: ['Stomach', 'Chest', 'Back', 'Neck'],
          correctAnswer: 'Stomach',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Neck.svg',
          options: ['Neck', 'Shoulder', 'Head', 'Chest'],
          correctAnswer: 'Neck',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Teeth.svg',
          options: ['Teeth', 'Tongue', 'Lips', 'Mouth'],
          correctAnswer: 'Teeth',
        ),
        QuizQuestion(
          imageAsset: 'assets/images/body/Wrist.svg',
          options: ['Wrist', 'Elbow', 'Arm', 'Hand'],
          correctAnswer: 'Wrist',
        ),
      ],
    );
  }
}
