import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/constants.dart';

class Greetings {
  final String name;
  final String imgAsset;
  final String soundAsset;
  final Color backgroundColor;

  Greetings({
    required this.name,
    required this.imgAsset,
    required this.soundAsset,
    required this.backgroundColor,
  });
}

class AppConstants {
  static const String greetings = 'Greetings';
  static final List<Greetings> greetingList = [
    Greetings(
      name: 'Hello',
      imgAsset: 'assets/Greetings/hi.svg',
      soundAsset: 'assets/sounds/hi.mp3',
      backgroundColor: Colors.white,
    ),
    Greetings(
      name: 'Say Cheese',
      imgAsset: 'assets/Greetings/say_cheese.svg',
      soundAsset: 'assets/sounds/good_morning.mp3',
      backgroundColor: Colors.orange,
    ),
    Greetings(
      name: 'Best of Luck',
      imgAsset: 'assets/Greetings/all_the_best.svg',
      soundAsset: 'assets/sounds/good_night.mp3',
      backgroundColor: Colors.blue,
    ),
    Greetings(
      name: 'Sorry',
      imgAsset: 'assets/Greetings/sorry.svg',
      soundAsset: 'assets/sounds/good_night.mp3',
      backgroundColor: Colors.orange,
    ),
    Greetings(
      name: 'Please',
      imgAsset: 'assets/Greetings/please.svg',
      soundAsset: 'assets/sounds/good_night.mp3',
      backgroundColor: Colors.blue,
    ),
    Greetings(
      name: 'Congratulations',
      imgAsset: 'assets/Greetings/congrats.svg',
      soundAsset: 'assets/sounds/good_night.mp3',
      backgroundColor: Colors.red,
    ),
  ];
}

class GreetingsPage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();

  GreetingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.greetings,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: GreetingsWidget(
          greetings: AppConstants.greetingList,
          flutterTts: flutterTts,
          audioPlayer: audioPlayer,
        ),
      ),
    );
  }
}

class GreetingsWidget extends StatefulWidget {
  final List<Greetings> greetings;
  final FlutterTts flutterTts;
  final AudioPlayer audioPlayer;

  GreetingsWidget({
    required this.greetings,
    required this.flutterTts,
    required this.audioPlayer,
  });

  @override
  _GreetingsWidgetState createState() => _GreetingsWidgetState();
}

class _GreetingsWidgetState extends State<GreetingsWidget> {
  int currentIndex = 0;

  void _navigateToNextGreeting() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.greetings.length;
    });
  }

  void _navigateToPreviousGreeting() {
    setState(() {
      currentIndex = (currentIndex - 1 + widget.greetings.length) % widget.greetings.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    Greetings greeting = widget.greetings[currentIndex];
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _navigateToNextGreeting,
            child: Container(
              width: 375,
              height: 375,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
                color: greeting.backgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    height: 350,
                    child: greeting.imgAsset.endsWith('.svg')
                        ? SvgPicture.asset(greeting.imgAsset)
                        : Image.asset(greeting.imgAsset),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            greeting.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 45,
              fontFamily: 'Comic',
            ),
          ),
          const SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _navigateToPreviousGreeting,
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  readName(greeting.name);
                },
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white, backgroundColor: Colors.grey, // Text color
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: 5,
                ),
                child: const Text(
                  'Pronounce',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: _navigateToNextGreeting,
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _playGreetingSound(String soundAsset) async {
    await widget.audioPlayer.setAsset(soundAsset);
    await widget.audioPlayer.play();
  }

  Future<void> readName(String name) async {
    await widget.flutterTts.setLanguage("EN-IN");
    await widget.flutterTts.speak(name);
  }
}
