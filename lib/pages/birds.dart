// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, depreSparrowed_member_use, must_be_immutable

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
      name: 'Falcon',
      svgAsset: 'assets/birds/Falcon.svg',
      soundAsset: 'assets/birds/Falcon.mp3',
      backgroundColor: const Color.fromARGB(193, 33, 149, 243),
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
      backgroundColor: Color.fromARGB(193, 252, 252, 252),
    ),
    Bird(
      name: 'Bulbul',
      svgAsset: 'assets/birds/Bulbul.svg',
      soundAsset: 'assets/birds/Bulbul.mp3',
      backgroundColor: Color.fromARGB(156, 91, 47, 3),
    ),
    Bird(
      name: 'Koel',
      svgAsset: 'assets/birds/Koel.svg',
      soundAsset: 'assets/birds/Koel.mp3',
      backgroundColor: Color.fromARGB(97, 96, 243, 33),
    ), 
    Bird(
      name: 'Baya',
      svgAsset: 'assets/birds/Baya.svg',
      soundAsset: 'assets/birds/Baya.mp3',
      backgroundColor: const Color.fromARGB(193, 43, 197, 35),
    ),
    Bird(
      name: 'Bagula',
      svgAsset: 'assets/birds/Bagula.svg',
      soundAsset: 'assets/birds/Bagula.mp3',
      backgroundColor: Color.fromARGB(156, 255, 255, 255),
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
      body: ListView.builder(
        itemCount: birds.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showBirdPopup(context, birds[index], index);
            },
            child: Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
                color: birds[index].backgroundColor,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset(birds[index].svgAsset),
                  ),
                  const SizedBox(width: 28.0),
                  Text(
                    birds[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      fontFamily: 'Comic',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Future<void> _showBirdPopup(
      BuildContext context, Bird bird, int currentIndex) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(.5);
    await flutterTts.setLanguage("EN-IN");
    await flutterTts.setPitch(1.0);

    showDialog(
      barrierColor: Colors.white .withOpacity(.3),
      context: context,
      builder: (BuildContext context) {
        return BirdPopup(
          bird: bird,
          flutterTts: flutterTts,
          audioPlayer: audioPlayer,
          birds: birds,
          currentIndex: currentIndex,
        );
      },
    );
  }
}

class BirdPopup extends StatefulWidget {
  Bird bird;
  final FlutterTts flutterTts;
  final AudioPlayer audioPlayer;
  final List<Bird> birds;

  int currentIndex;

  BirdPopup({
    Key? key,
    required this.bird,
    required this.flutterTts,
    required this.audioPlayer,
    required this.birds,
    required this.currentIndex,
  }) : super(key: key);

  @override
  _BirdPopupState createState() => _BirdPopupState();
}

class _BirdPopupState extends State<BirdPopup> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.bird.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              _speakBirdName(widget.bird.name);
            },
            icon: const Icon(Icons.volume_up),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isTapped = !isTapped;
              });
            },
            child: SizedBox(
              width: 200,
              height: 200,
              child: SvgPicture.asset(
                widget.bird.svgAsset,
                color: isTapped ? const Color.fromARGB(81, 118, 96, 94) : null,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _playBirdSound(widget.bird.soundAsset);
            },
            child: const Text('Play Sound'),
          ),
          Row(
            children: [
              IconButton(
                onPressed: () {
                  _navigateToPreviousBird();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(
                width: 135,
              ),
              IconButton(
                onPressed: () {
                  _navigateToNextBird();
                },
                icon: const Icon(Icons.arrow_forward),
              ),
            ],
          )
        ],
      ),
      actions: [
        ElevatedButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
          ),
          onPressed: () {
            _stopBirdSound();
            Navigator.of(context).pop();
          },
          child: const Text(
            'Close',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }

  void _navigateToPreviousBird() {
    setState(() {
      widget.currentIndex = (widget.currentIndex - 1) % widget.birds.length;
      if (widget.currentIndex < 0) {
        widget.currentIndex = widget.birds.length - 1;
      }
      widget.bird = widget.birds[widget.currentIndex];
    });
  }

  void _navigateToNextBird() {
    setState(() {
      widget.currentIndex = (widget.currentIndex + 1) % widget.birds.length;
      widget.bird = widget.birds[widget.currentIndex];
    });
  }

  Future<void> _playBirdSound(String soundAsset) async {
    await widget.audioPlayer.setAsset(soundAsset);
    await widget.audioPlayer.play();
  }

  Future<void> _stopBirdSound() async {
    await widget.audioPlayer.stop();
  }

  Future<void> _speakBirdName(String name) async {
    await widget.flutterTts.speak(name);
  }
}
