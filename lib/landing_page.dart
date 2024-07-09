import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:learn/utils/route/route_constant.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({
    super.key,
  });

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Center(
                child: Container(
                  width: width,
                  height: height / 2,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/studying.png"),
                        fit: BoxFit.contain),
                  ),
                ),
              ),

              Center(
                child: SizedBox(
                  child: DefaultTextStyle(
                    style: TextStyle(
                      fontSize: width / 19,
                    ),
                    child: AnimatedTextKit(
                      animatedTexts: [
                        ColorizeAnimatedText(
                          'Learn',
                          textStyle: TextStyle(
                              fontSize: width / 12,
                              fontWeight: FontWeight.w900),
                          colors: [
                            const Color.fromRGBO(255, 183, 77, 1),
                            const Color.fromARGB(255, 231, 225, 208)
                          ],
                        ),
                      ],
                      isRepeatingAnimation: true,
                    ),
                  ),
                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 20)),
              //
              Center(
                child: SizedBox(
                  child: Text(
                    "Learning Made Easy",
                    style: TextStyle(
                        fontWeight: FontWeight.w400, fontSize: width / 18),
                  ),
                ),
              ),

              const Padding(padding: EdgeInsets.only(top: 30)),

              Center(
                child: SizedBox(
                  width: width / 1.5,
                  height: height / 10,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(255, 183, 77, 1),
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                        )),
                    onPressed: () async {
                      //bool check initiates
                      final SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      if (!prefs.containsKey('visitedGettingStartedPageOnce') || prefs.getBool('visitedGettingStartedPageOnce')==false) { //if it never existed or if it is false somehow
                        await prefs.setBool(
                            'visitedGettingStartedPageOnce', true); //set to true
                      }
                      Navigator.popAndPushNamed(
                        context,
                        AllRoutesConstant.homeRoute,
                      );
                    },
                    child: Text(
                      "Get started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              (width < height) ? width / 19 : height / 19),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
