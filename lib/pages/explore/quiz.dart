// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:learn/utils/constants.dart';

class Quiz extends StatefulWidget {
  static const routeName = "/quiz";
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class Questions {
  String question;
  List<String> options;
  String? image;
  int answer;

  Questions({
    required this.question,
    required this.options,
    required this.answer,
    this.image,
  });
}

class _QuizState extends State<Quiz> {
  int _score = 0;
  int SelectedIndex = -1;
  bool istappable = true;
  int questionnumber = 0;

  void _resetQuiz() {
    setState(() {
      _score = 0;
      SelectedIndex = -1;
      istappable = true;
      questionnumber = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Question ${questionnumber + 1}/${AppConstants.ques.length}",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: width * 0.90,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    spreadRadius: 1,
                    blurRadius: 3,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  AppConstants.ques[questionnumber].image != null
                      ? SizedBox(
                          height: 200,
                          width: 200,
                          child: Image.asset(
                            AppConstants.ques[questionnumber].image!,
                          ),
                        )
                      : const SizedBox(
                          height: 10,
                        ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    AppConstants.ques[questionnumber].question,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) => options(
                    width: width,
                    option: AppConstants.ques[questionnumber].options[index],
                    currentindex: index,
                    selectedIndex: SelectedIndex),
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount: 4,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {
                if (SelectedIndex == -1) {
                  return;
                }
                if (questionnumber < AppConstants.ques.length - 1) {
                  setState(() {
                    questionnumber++;
                    SelectedIndex = -1;
                    istappable = true;
                  });
                } else {
                  showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                            content: SizedBox(
                              height: height * 0.4,
                              width: width * 0.8,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "Congratulations !!!",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headlineMedium
                                        ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                        ),
                                  ),
                                  Text(
                                    "You Have Scored $_score out of ${AppConstants.ques.length}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleLarge
                                        ?.copyWith(
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 20),
                                        maximumSize: Size(width * 0.7, 60),
                                        minimumSize: Size(width * 0.7, 60),
                                      ),
                                      onPressed: () {
                                        _resetQuiz();
                                        Navigator.of(context)
                                            .pop(); // Close dialog
                                        Navigator.of(context)
                                            .pop(); // Go back to explore
                                      },
                                      child: const Text("Go Back"))
                                ],
                              ),
                            ),
                          ));
                }
              },
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                maximumSize: Size(width * 0.7, 60),
                minimumSize: Size(width * 0.7, 60),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40),
                ),
              ),
              child: const Text(
                "Continue",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  options(
      {required double width,
      required String option,
      required int currentindex,
      required selectedIndex}) {
    return InkWell(
      onTap: () {
        setState(() {
          if (istappable) {
            SelectedIndex = currentindex;
            if (currentindex == AppConstants.ques[questionnumber].answer) {
              _score++;
              setState(() {});
            }
            istappable = false;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        width: width * 0.9,
        decoration: BoxDecoration(
          color: selectedIndex == currentindex
              ? currentindex == AppConstants.ques[questionnumber].answer
                  ? Colors.green.withOpacity(0.3)
                  : Colors.red.withOpacity(0.3)
              : Theme.of(context).cardColor,
          border: Border.all(
            color: selectedIndex == currentindex
                ? currentindex == AppConstants.ques[questionnumber].answer
                    ? Colors.green
                    : Colors.red
                : Theme.of(context).dividerColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).cardColor,
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedIndex == currentindex
                      ? currentindex == AppConstants.ques[questionnumber].answer
                          ? Colors.green
                          : Colors.red
                      : Theme.of(context).dividerColor,
                  width: selectedIndex == currentindex ? 5 : 1,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              option,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}
