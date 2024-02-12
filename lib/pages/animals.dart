// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';

class Animal {
  final String name;
  final String svgAsset;
  final String soundAsset;
  final Color backgroundColor;

  Animal({
    required this.name,
    required this.svgAsset,
    required this.soundAsset,
    required this.backgroundColor,
  });
}

class AnimalsPage extends StatelessWidget {
  final List<Animal> animals = [
    Animal(
      name: 'Cat',
      svgAsset: 'assets/images/cat.svg',
      soundAsset: 'assets/sounds/cat_sound.wav',
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Animal(
      name: 'Deer',
      svgAsset: 'assets/images/deer.svg',
      soundAsset: 'assets/sounds/deer_sound.mp3',
      backgroundColor: const Color.fromARGB(194, 157, 82, 222),
    ),
    Animal(
      name: 'Bear',
      svgAsset: 'assets/images/bear.svg',
      soundAsset: 'assets/sounds/bear_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 207, 222),
    ),
    Animal(
      name: 'Cow',
      svgAsset: 'assets/images/cow.svg',
      soundAsset: 'assets/sounds/cow_sound.mp3',
      backgroundColor: const Color.fromARGB(157, 251, 0, 0),
    ),
    Animal(
      name: 'Fox',
      svgAsset: 'assets/images/fox.svg',
      soundAsset: 'assets/sounds/fox_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 21, 234, 28),
    ),
    Animal(
      name: 'Giraffe',
      svgAsset: 'assets/images/giraffe.svg',
      soundAsset: 'assets/sounds/giraffe_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 226, 221, 70),
    ),
    Animal(
      name: 'Goat',
      svgAsset: 'assets/images/goat.svg',
      soundAsset: 'assets/sounds/goat_sound.mp3',
      backgroundColor: const Color.fromARGB(139, 23, 31, 23),
    ),
    Animal(
      name: 'Kangaroo',
      svgAsset: 'assets/images/kangaroo.svg',
      soundAsset: 'assets/sounds/kangaroo_sound.mp3',
      backgroundColor: const Color.fromARGB(154, 221, 214, 209),
    ),
    Animal(
      name: 'Monkey',
      svgAsset: 'assets/images/monkey.svg',
      soundAsset: 'assets/sounds/monkey_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Animal(
      name: 'Pig',
      svgAsset: 'assets/images/pig.svg',
      soundAsset: 'assets/sounds/pig_sound.mp3',
      backgroundColor: const Color.fromARGB(151, 40, 137, 248),
    ),
    Animal(
      name: 'Sheep',
      svgAsset: 'assets/images/sheep.svg',
      soundAsset: 'assets/sounds/sheep_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 240, 241, 170),
    ),
    Animal(
      name: 'Snake',
      svgAsset: 'assets/images/snake.svg',
      soundAsset: 'assets/sounds/snake_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 134, 228, 137),
    ),
    Animal(
      name: 'Squirrel',
      svgAsset: 'assets/images/squirrel.svg',
      soundAsset: 'assets/sounds/squirrel_sound.mp3',
      backgroundColor: const Color.fromARGB(139, 175, 140, 76),
    ),
    Animal(
      name: 'Tiger',
      svgAsset: 'assets/images/tiger.svg',
      soundAsset: 'assets/sounds/tiger_sound.mp3',
      backgroundColor: const Color.fromARGB(157, 251, 151, 0),
    ),
    Animal(
      name: 'Zebra',
      svgAsset: 'assets/images/zebra.svg',
      soundAsset: 'assets/sounds/zebra_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 187, 74, 178),
    ),
    Animal(
      name: 'Dog',
      svgAsset: 'assets/images/dog.svg',
      soundAsset: 'assets/sounds/dog_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 33, 149, 243),
    ),
    Animal(
      name: 'Elephant',
      svgAsset: 'assets/images/elephant.svg',
      soundAsset: 'assets/sounds/elephant_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 182, 221, 252),
    ),
    Animal(
      name: 'Horse',
      svgAsset: 'assets/images/horse.svg',
      soundAsset: 'assets/sounds/horse_sound.mp3',
      backgroundColor: const Color.fromARGB(98, 243, 201, 33),
    ),
    Animal(
      name: 'Lion',
      svgAsset: 'assets/images/lion.svg',
      soundAsset: 'assets/sounds/lion_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 43, 197, 35),
    ),
    Animal(
      name: 'Rabbit',
      svgAsset: 'assets/images/rabbit.svg',
      soundAsset: 'assets/sounds/rabbit_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 243, 33, 236),
    ),
  ];

  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();

  AnimalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Animals',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: animals.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showAnimalPopup(context, animals[index]);
            },
            child: Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
                color: animals[index].backgroundColor,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset(animals[index].svgAsset),
                  ),
                  const SizedBox(width: 28.0),
                  Text(
                    animals[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      fontFamily: 'Comic Sans MS',
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

  Future<void> _showAnimalPopup(BuildContext context, Animal animal) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(.5);
    await flutterTts.setLanguage("EN-IN");
    await flutterTts.setPitch(1.0);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AnimalPopup(
          animal: animal,
          flutterTts: flutterTts,
          audioPlayer: audioPlayer, animals: animals,
        );
      },
    );
  }
}

class AnimalPopup extends StatefulWidget {
  Animal animal;
  final FlutterTts flutterTts;
  final AudioPlayer audioPlayer;
  final List<Animal> animals; // Add animals parameter here

   AnimalPopup({
    Key? key,
    required this.animal,
    required this.flutterTts,
    required this.audioPlayer,
    required this.animals, // Initialize animals parameter here
  }) : super(key: key);

  @override
  _AnimalPopupState createState() => _AnimalPopupState();
}

class _AnimalPopupState extends State<AnimalPopup> {
  bool isTapped = false;
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              _navigateToPreviousAnimal();
            },
            icon: const Icon(Icons.arrow_back),
          ),
          Text(
            widget.animal.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: () {
              _navigateToNextAnimal();
            },
            icon: const Icon(Icons.arrow_forward),
          ),
          IconButton(
            onPressed: () {
              _speakAnimalName(widget.animal.name);
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
                widget.animal.svgAsset,
                color: isTapped ? const Color.fromARGB(81, 118, 96, 94) : null,
              ),
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              _playAnimalSound(widget.animal.soundAsset);
            },
            child: const Text('Play Sound'),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            _stopAnimalSound();
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    );
  }

  void _navigateToPreviousAnimal() {
    setState(() {
      currentIndex = (currentIndex - 1) % widget.animals.length;
      if (currentIndex < 0) {
        currentIndex = widget.animals.length - 1;
      }
      widget.animal = widget.animals[currentIndex];
    });
  }

  void _navigateToNextAnimal() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.animals.length;
      widget.animal = widget.animals[currentIndex];
    });
  }



  Future<void> _playAnimalSound(String soundAsset) async {
    await widget.audioPlayer.setAsset(soundAsset);
    await widget.audioPlayer.play();
  }

  Future<void> _stopAnimalSound() async {
    await widget.audioPlayer.stop();
  }

  Future<void> _speakAnimalName(String name) async {
    await widget.flutterTts.speak(name);
  }
}
