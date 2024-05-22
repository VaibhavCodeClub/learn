// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learn/models/bird_model.dart';
import 'package:learn/utils/constants.dart';

class BirdsPage extends StatelessWidget {

  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();

  BirdsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.bird,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: BirdWidget(
          birds: AppConstants.birds,
          flutterTts: flutterTts,
          audioPlayer: audioPlayer,
        ),
      ),
    );
  }
}

class BirdWidget extends StatefulWidget {
  final List<Bird> birds;
  final FlutterTts flutterTts;
  final AudioPlayer audioPlayer;

  BirdWidget({
    required this.birds,
    required this.flutterTts,
    required this.audioPlayer,
  });

  @override
  _BirdWidgetState createState() => _BirdWidgetState();
}

class _BirdWidgetState extends State<BirdWidget> {
  int currentIndex = 0;

  void _navigateToNextBird() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.birds.length;
    });
  }

  void _navigateToPreviousBird() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + widget.birds.length) % widget.birds.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    Bird bird = widget.birds[currentIndex];
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: _navigateToNextBird,
            child: Container(
              width: 375,
              height: 375,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(8.0),
                color: bird.backgroundColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 350,
                    height: 350,
                    child: SvgPicture.asset(bird.svgAsset),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
          IconButton.outlined(
            highlightColor: Colors.amber,
            onPressed: () {
              readName(
                bird.name,
              );
            },
            icon: const Icon(Icons.volume_up_outlined),
          ),
          Text(
            bird.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 60,
              fontFamily: 'Comic',
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _navigateToPreviousBird,
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  _playBirdSound(bird.soundAsset);
                },
                child: const Text('Play Sound'),
              ),
              const SizedBox(width: 20),
              IconButton(
                onPressed: _navigateToNextBird,
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Future<void> _playBirdSound(String soundAsset) async {
    await widget.audioPlayer.setAsset(soundAsset);
    await widget.audioPlayer.play();
  }

  Future<void> readName(String name) async {
    await widget.flutterTts.setLanguage("EN-IN");
    await widget.flutterTts.speak(name);
  }
}
