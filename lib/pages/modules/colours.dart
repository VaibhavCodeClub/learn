// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/utils/assets_path.dart';
import '../../utils/const_dimensions.dart';
import 'package:learn/models/colours_model.dart';

import '../../utils/constants.dart';

class ColoursPage extends StatefulWidget {
  const ColoursPage({Key? key}) : super(key: key);

  @override
  _ColoursPageState createState() => _ColoursPageState();
}

class _ColoursPageState extends State<ColoursPage> {


  final FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;

  void _navigateToNextColour() {
    setState(() {
      currentIndex = (currentIndex + 1) % AppConstants.colours.length;
    });
  }

  void _navigateToPreviousColour() {
    setState(() {
      currentIndex = (currentIndex - 1 + AppConstants.colours.length) % AppConstants.colours.length;
    });
  }

  Future<void> readName(String name) async {
    await flutterTts.setLanguage("EN-IN");
    await flutterTts.speak(name);
  }

  @override
  Widget build(BuildContext context) {
    Colours colour = AppConstants.colours[currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppConstants.color,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            color: colour.bgColor,
          ),
        ),
      ),
      backgroundColor: colour.bgColor,
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            constraints: const BoxConstraints(maxWidth: 400, maxHeight: 700),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.circular(7.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _navigateToNextColour,
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    child: SvgPicture.asset(
                      colour.jpgAsset,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  colour.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 60,
                    fontFamily: 'Comic',
                    color: colour.fontColor,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: _navigateToPreviousColour,
                      icon: const Icon(
                        Icons.arrow_back,
                        size: 30,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton.outlined(
                      highlightColor: Colors.amber,
                      onPressed: () {
                        readName(colour.name);
                      },
                      icon: const Icon(
                        Icons.volume_up_outlined,
                        size: 40,
                      ),
                    ),
                    const SizedBox(width: 20),
                    IconButton(
                      onPressed: _navigateToNextColour,
                      icon: const Icon(
                        Icons.arrow_forward,
                        size: 30,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
