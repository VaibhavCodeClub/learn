// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';

class Bird {
  final String name;
  final String svgAsset;
  final String soundAsset;
  final Color backgroundColor;

  Bird({
    required this.name,
    required this.svgAsset,
    required this.soundAsset,
    required this.backgroundColor,
  });
}

class BirdsPage extends StatelessWidget {
  final List<Bird> birds = [
    Bird(
      name: 'Sparrow',
      svgAsset: 'assets/birds/Sparrow.svg',
      soundAsset: 'assets/birds/Sparrow.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Bird(
      name: 'Robin',
      svgAsset: 'assets/birds/Robin.svg',
      soundAsset: 'assets/birds/Robin.mp3',
      backgroundColor: const Color.fromARGB(194, 157, 82, 222),
    ),
    Bird(
      name: 'Crow',
      svgAsset: 'assets/birds/Crow.svg',
      soundAsset: 'assets/birds/Crow.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 207, 222),
    ),
    Bird(
      name: 'Seagull',
      svgAsset: 'assets/birds/Seagull.svg',
      soundAsset: 'assets/birds/Seagull.mp3',
      backgroundColor: const Color.fromARGB(193, 21, 234, 28),
    ),
    Bird(
      name: 'Duck',
      svgAsset: 'assets/birds/Duck.svg',
      soundAsset: 'assets/birds/Duck.mp3',
      backgroundColor: const Color.fromARGB(193, 226, 221, 70),
    ),
    Bird(
      name: 'Hen',
      svgAsset: 'assets/birds/Hen.svg',
      soundAsset: 'assets/birds/Hen.mp3',
      backgroundColor: const Color.fromARGB(138, 48, 59, 48),
    ),
    Bird(
      name: 'Eagle',
      svgAsset: 'assets/birds/Eagle.svg',
      soundAsset: 'assets/birds/Eagle.mp3',
      backgroundColor: const Color.fromARGB(154, 221, 214, 209),
    ),
    Bird(
      name: 'Owl',
      svgAsset: 'assets/birds/Owl.svg',
      soundAsset: 'assets/birds/Owl.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Bird(
      name: 'Hummingbird',
      svgAsset: 'assets/birds/Hummingbird.svg',
      soundAsset: 'assets/birds/Hummingbird.mp3',
      backgroundColor: const Color.fromARGB(151, 40, 137, 248),
    ),
    Bird(
      name: 'Parrot',
      svgAsset: 'assets/birds/Parrot.svg',
      soundAsset: 'assets/birds/Parrot.mp3',
      backgroundColor: const Color.fromARGB(193, 240, 241, 170),
    ),
    Bird(
      name: 'Swan',
      svgAsset: 'assets/birds/Swan.svg',
      soundAsset: 'assets/birds/Swan.mp3',
      backgroundColor: const Color.fromARGB(193, 125, 176, 127),
    ),
    Bird(
      name: 'Goose',
      svgAsset: 'assets/birds/Goose.svg',
      soundAsset: 'assets/birds/Goose.mp3',
      backgroundColor: const Color.fromARGB(139, 175, 140, 76),
    ),
    Bird(
      name: 'Woodpecker',
      svgAsset: 'assets/birds/Woodpecker.svg',
      soundAsset: 'assets/birds/Woodpecker.mp3',
      backgroundColor: const Color.fromARGB(157, 251, 151, 0),
    ),
    Bird(
      name: 'Kingfisher',
      svgAsset: 'assets/birds/Kingfisher.svg',
      soundAsset: 'assets/birds/Kingfisher.mp3',
      backgroundColor: const Color.fromARGB(193, 187, 74, 178),
    ),
    Bird(
      name: 'Ostrich',
      svgAsset: 'assets/birds/Ostrich.svg',
      soundAsset: 'assets/birds/Ostrich.mp3',
      backgroundColor: const Color.fromARGB(193, 182, 221, 252),
    ),
    Bird(
      name: 'Vulture',
      svgAsset: 'assets/birds/Vulture.svg',
      soundAsset: 'assets/birds/Vulture.mp3',
      backgroundColor: const Color.fromARGB(98, 243, 201, 33),
    ),
    Bird(
      name: 'Maina',
      svgAsset: 'assets/birds/Maina.svg',
      soundAsset: 'assets/birds/Maina.mp3',
      backgroundColor: const Color.fromARGB(255, 73, 179, 63),
    ),
    Bird(
      name: 'Bulbul',
      svgAsset: 'assets/birds/Bulbul.svg',
      soundAsset: 'assets/birds/Bulbul.mp3',
      backgroundColor: const Color.fromARGB(156, 128, 222, 243),
    ),
    Bird(
      name: 'Koel',
      svgAsset: 'assets/birds/Koel.svg',
      soundAsset: 'assets/birds/Koel.mp3',
      backgroundColor: const Color.fromARGB(232, 141, 255, 93),
    ),
    Bird(
      name: 'Baya',
      svgAsset: 'assets/birds/Baya.svg',
      soundAsset: 'assets/birds/Baya.mp3',
      backgroundColor: const Color.fromARGB(193, 106, 190, 101),
    ),
    Bird(
      name: 'Bagula',
      svgAsset: 'assets/birds/Bagula.svg',
      soundAsset: 'assets/birds/Bagula.mp3',
      backgroundColor: const Color.fromARGB(156, 248, 248, 248),
    ),
  ];

  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();

  BirdsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Birds',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: BirdWidget(
          birds: birds,
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
              const SizedBox(height: 20),
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
