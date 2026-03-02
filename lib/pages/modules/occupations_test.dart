// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:learn/widgets/quiz_widget.dart';

class OccupationsTestPage extends StatelessWidget {
  const OccupationsTestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return QuizWidget(
      title: 'Occupations Test',
      allQuestions: [
        QuizQuestion(
          imageAsset: 'assets/occupations/doctor.svg',
          options: ['Doctor', 'Nurse', 'Dentist', 'Vet'],
          correctAnswer: 'Doctor',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/teacher.svg',
          options: ['Teacher', 'Professor', 'Tutor', 'Instructor'],
          correctAnswer: 'Teacher',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/engineer.svg',
          options: ['Engineer', 'Architect', 'Builder', 'Designer'],
          correctAnswer: 'Engineer',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/farmer.svg',
          options: ['Farmer', 'Gardener', 'Rancher', 'Herder'],
          correctAnswer: 'Farmer',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/pilot.svg',
          options: ['Pilot', 'Captain', 'Astronaut', 'Driver'],
          correctAnswer: 'Pilot',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/police.svg',
          options: ['Police', 'Guard', 'Soldier', 'Detective'],
          correctAnswer: 'Police',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/dentist.svg',
          options: ['Doctor', 'Dentist', 'Surgeon', 'Vet'],
          correctAnswer: 'Dentist',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/lawyer.svg',
          options: ['Lawyer', 'Judge', 'Attorney', 'Advocate'],
          correctAnswer: 'Lawyer',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/artist.svg',
          options: ['Artist', 'Painter', 'Sculptor', 'Designer'],
          correctAnswer: 'Artist',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/author.svg',
          options: ['Author', 'Writer', 'Poet', 'Journalist'],
          correctAnswer: 'Author',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/barber.svg',
          options: ['Barber', 'Hairdresser', 'Stylist', 'Groomer'],
          correctAnswer: 'Barber',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/carpenter.svg',
          options: ['Carpenter', 'Builder', 'Plumber', 'Electrician'],
          correctAnswer: 'Carpenter',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/electrician.svg',
          options: ['Plumber', 'Electrician', 'Carpenter', 'Mechanic'],
          correctAnswer: 'Electrician',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/photographer.svg',
          options: ['Photographer', 'Cameraman', 'Artist', 'Designer'],
          correctAnswer: 'Photographer',
        ),
        QuizQuestion(
          imageAsset: 'assets/occupations/vet.svg',
          options: ['Doctor', 'Vet', 'Dentist', 'Nurse'],
          correctAnswer: 'Vet',
        ),
      ],
    );
  }
}
