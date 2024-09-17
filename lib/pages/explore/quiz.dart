// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:learn/utils/constants.dart';
import 'package:learn/utils/route/route_constant.dart';

class Quiz extends StatefulWidget {
  static const routeName = "/quiz";
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}
class _QuizState extends State<Quiz> {
  int _score = 0;
  int SelectedIndex = -1;
  bool istappable = true;
  int questionnumber = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double toppadding = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            SizedBox(
              height: toppadding,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                ),
                Text(
                  "Question ${questionnumber + 1}/${AppConstants.ques.length}",
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  width: 50,
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              width: width * 0.90,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  AppConstants.ques[questionnumber].image != null
                      ? Container(
                          height: 200,
                          width: 200,
                          color: Colors.white,
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
                    AppConstants.ques[questionnumber].question, // [1]
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600),
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
                      builder: (context) => AlertDialog(
                            content: SizedBox(
                              height: height * 0.4,
                              width: width * 0.8,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    "Congratulations !!!",
                                    style: TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "You Have Scored $_score out of ${AppConstants.ques.length}",
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.purple,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 40, vertical: 20),
                                        maximumSize: Size(width * 0.7, 60),
                                        minimumSize: Size(width * 0.7, 60),
                                      ),
                                      onPressed: () {
                                        // Navigator.of(context).pop();
                                        Navigator.of(context)
                                            .pushReplacementNamed(
                                                AllRoutesConstant
                                                    .mainhomeRoute);
                                      },
                                      child: const Text(
                                        "Go Back",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                            ),
                          ));
                  // Navigator.of(context).pushNamed(ResultPage.routeName,
                  //     arguments: _score.toString());
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
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
                  color: Colors.white,
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
              : Colors.white,
          border: Border.all(
            color: selectedIndex == currentindex
                ? currentindex == AppConstants.ques[questionnumber].answer
                    ? Colors.green
                    : Colors.red
                : Colors.black,
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
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(
                  color: selectedIndex == currentindex
                      ? currentindex == AppConstants.ques[questionnumber].answer
                          ? Colors.green
                          : Colors.red
                      : Colors.black,
                  width: selectedIndex == currentindex ? 5 : 1,
                ),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              option,
              style: const TextStyle(fontSize: 22, color: Colors.black),
            ),
          ],
        ),
      ),
    );
  }
}
