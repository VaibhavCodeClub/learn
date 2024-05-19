import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/utils/constants.dart';

class QuizQuestion {
  final String question;
  final List<String> options;
  final int correctAnswerIndex;

  QuizQuestion({
    required this.question,
    required this.options,
    required this.correctAnswerIndex,
  });
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  late List<QuizQuestion> _questions;
  int _currentQuestionIndex = 0;
  int _score = 0;
  bool _quizCompleted = false;
  String _feedbackMessage = '';
  Color _feedbackColor = Colors.transparent;
  bool _answered = false;

  @override
  void initState() {
    super.initState();
    _questions = List.from(AppConstants.quizQuestions);
    _questions.shuffle();
    if (_questions.length > 10) {
      _questions = _questions.sublist(0, 10);
    }
  }

  void _answerQuestion(int selectedIndex) {
    if (_answered) return;

    bool isCorrect =
        selectedIndex == _questions[_currentQuestionIndex].correctAnswerIndex;
    setState(() {
      _answered = true;
      if (isCorrect) {
        _score++;
        _feedbackMessage = 'Correct! Good job!';
        _feedbackColor = Colors.green;
      } else {
        _feedbackMessage =
            'Incorrect. The correct answer is: ${_questions[_currentQuestionIndex].options[_questions[_currentQuestionIndex].correctAnswerIndex]}';
        _feedbackColor = Colors.red;
      }
    });
  }

  void _nextQuestion() {
    setState(() {
      if (_currentQuestionIndex < _questions.length - 1) {
        _currentQuestionIndex++;
        _feedbackMessage = '';
        _feedbackColor = Colors.transparent;
        _answered = false;
      } else {
        _quizCompleted = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _quizCompleted
            ? Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quiz Completed! Your score is $_score/${_questions.length}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('Back to Explore'),
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Question ${_currentQuestionIndex + 1}/${_questions.length}',
                    style: const TextStyle(
                        fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    _questions[_currentQuestionIndex].question,
                    style: const TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 20),
                  Column(
                    children: List.generate(
                      _questions[_currentQuestionIndex].options.length,
                      (index) => GestureDetector(
                        onTap: () => _answerQuestion(index),
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1.0),
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.blueAccent.withOpacity(0.2),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 30,
                                height: 30,
                                child:
                                    SvgPicture.asset('assets/explore/dot.svg'),
                              ),
                              const SizedBox(width: 12.0),
                              Expanded(
                                child: Text(
                                  _questions[_currentQuestionIndex]
                                      .options[index],
                                  style: const TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (_feedbackMessage.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(12.0),
                      decoration: BoxDecoration(
                        color: _feedbackColor.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8.0),
                        border: Border.all(color: _feedbackColor, width: 1.0),
                      ),
                      child: Text(
                        _feedbackMessage,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: _feedbackColor,
                        ),
                      ),
                    ),
                  const SizedBox(height: 20),
                  if (_answered && !_quizCompleted)
                    ElevatedButton(
                      onPressed: _nextQuestion,
                      child: const Text('Next Question'),
                    ),
                ],
              ),
      ),
    );
  }
}
