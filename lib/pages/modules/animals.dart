// ignore_for_file: use_build_context_synchronously, library_private_types_in_public_api, deprecated_member_use, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learn/models/animal_model.dart';
import 'package:learn/utils/constants.dart';

import '../../utils/const_dimensions.dart';
import 'animals_test.dart';

class AnimalsPage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();

  AnimalsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.animal,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.assessment),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AnimalsTestPage()),
              );
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: AppConstants.animals.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showAnimalPopup(context, AppConstants.animals[index], index);
            },
            child: Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
                color: AppConstants.animals[index].backgroundColor,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: ConstantDimensions.widthExtraLarge,
                    height: ConstantDimensions.heightExtraLarge,
                    child:
                        SvgPicture.asset(AppConstants.animals[index].svgAsset),
                  ),
                  const SizedBox(width: ConstantDimensions.widthMedium_Large),
                  Text(
                    AppConstants.animals[index].name,
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

  Future<void> _showAnimalPopup(
      BuildContext context, Animal animal, int currentIndex) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setSpeechRate(.5);
    await flutterTts.setLanguage("EN-IN");
    await flutterTts.setPitch(1.0);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          child: AnimalPopup(
            animal: animal,
            flutterTts: flutterTts,
            audioPlayer: audioPlayer,
            animals: AppConstants.animals,
            currentIndex: currentIndex,
          ),
        );
      },
    );
  }
}

class AnimalPopup extends StatefulWidget {
  Animal animal;
  final FlutterTts flutterTts;
  final AudioPlayer audioPlayer;
  final List<Animal> animals;

  int currentIndex;

  AnimalPopup({
    Key? key,
    required this.animal,
    required this.flutterTts,
    required this.audioPlayer,
    required this.animals,
    required this.currentIndex,
  }) : super(key: key);

  @override
  _AnimalPopupState createState() => _AnimalPopupState();
}

class _AnimalPopupState extends State<AnimalPopup> {
  bool isTapped = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.animal.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
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
            child: SvgPicture.asset(
              widget.animal.svgAsset,
              color: isTapped ? const Color.fromARGB(81, 118, 96, 94) : null,
              width: MediaQuery.of(context).size.width * 0.3,
              height: MediaQuery.of(context).size.height * 0.3,
            ),
          ),
          const SizedBox(height: ConstantDimensions.heightSmall_Medium),
          ElevatedButton(
            onPressed: () {
              _playAnimalSound(widget.animal.soundAsset);
            },
            child: const Text('Play Sound'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  _navigateToPreviousAnimal();
                },
                icon: const Icon(Icons.arrow_back),
                iconSize: 30,
              ),
              SizedBox(
                width: ConstantDimensions.exceptions[0],
              ),
              IconButton(
                onPressed: () {
                  _navigateToNextAnimal();
                },
                icon: const Icon(Icons.arrow_forward),
                iconSize: 30,
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
            _stopAnimalSound();
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

  void _navigateToPreviousAnimal() {
    setState(() {
      widget.currentIndex = (widget.currentIndex - 1) % widget.animals.length;
      if (widget.currentIndex < 0) {
        widget.currentIndex = widget.animals.length - 1;
      }
      widget.animal = widget.animals[widget.currentIndex];
    });
  }

  void _navigateToNextAnimal() {
    setState(() {
      widget.currentIndex = (widget.currentIndex + 1) % widget.animals.length;
      widget.animal = widget.animals[widget.currentIndex];
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
