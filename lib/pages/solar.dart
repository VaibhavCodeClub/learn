import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learn/main.dart';
 
class Planet {
  final String name;
  final String svgAsset;
  final String description;
  final Color backgroundColor;
 
  Planet({
    required this.name,
    required this.svgAsset,
    required this.description,
    required this.backgroundColor,
  });
}
 
class PlanetsPage extends StatelessWidget {
  final List<Planet> planets = [
    Planet(
      name: 'Sun',
      svgAsset: 'assets/solar/sun.svg',
      description: 'Sun is the biggest star in the solar system.',
      backgroundColor: const Color.fromARGB(255, 208, 211, 23),
    ),
    Planet(
      name: 'Mercury',
      svgAsset: 'assets/solar/mercury.svg',
      description: 'Mercury is the closest planet to the Sun.',
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
    ),
    Planet(
      name: 'Venus',
      svgAsset: 'assets/solar/venus.svg',
      description: 'Venus is known for its thick atmosphere.',
      backgroundColor: const Color.fromARGB(255, 240, 193, 95),
    ),
    Planet(
      name: 'Earth',
      svgAsset: 'assets/solar/earth.svg',
      description: 'Earth is the third planet from the Sun.',
      backgroundColor: const Color.fromARGB(255, 81, 149, 192),
    ),
    Planet(
      name: 'Mars',
      svgAsset: 'assets/solar/mars.svg',
      description: 'Mars is often called the Red Planet.',
      backgroundColor: const Color.fromARGB(255, 238, 118, 96),
    ),
    Planet(
      name: 'Jupiter',
      svgAsset: 'assets/solar/jupiter.svg',
      description: 'Jupiter is the largest planet in our solar system.',
      backgroundColor: const Color.fromARGB(255, 204, 164, 122),
    ),
    Planet(
      name: 'Saturn',
      svgAsset: 'assets/solar/saturn.svg',
      description: 'Saturn is known for its beautiful rings.',
      backgroundColor: const Color.fromARGB(255, 229, 215, 194),
    ),
    Planet(
      name: 'Uranus',
      svgAsset: 'assets/solar/uranus.png',
      description: 'Uranus is an ice giant with a unique rotation axis.',
      backgroundColor: const Color.fromARGB(255, 169, 222, 246),
    ),
    Planet(
      name: 'Neptune',
      svgAsset: 'assets/solar/neptune.svg',
      description: 'Neptune is the farthest planet from the Sun.',
      backgroundColor: const Color.fromARGB(255, 64, 90, 200),
    ),
  ];
 
  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();
 
  PlanetsPage({Key? key}) : super(key: key);
 
=======
import 'package:learn/utils/constants.dart';
import 'package:learn/widgets/drawer.dart';

class SolarPage extends StatelessWidget {
  const SolarPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.solar,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(
        child: PlanetWidget(
          planets: planets,
          flutterTts: flutterTts,
          audioPlayer: audioPlayer,
        ),
      ),
    );
  }
}
 
class PlanetWidget extends StatefulWidget {
  final List<Planet> planets;
  final FlutterTts flutterTts;
  final AudioPlayer audioPlayer;
 
  const PlanetWidget({
    Key? key,
    required this.planets,
    required this.flutterTts,
    required this.audioPlayer,
  }) : super(key: key);
 
  @override
  _PlanetWidgetState createState() => _PlanetWidgetState();
}
 
class _PlanetWidgetState extends State<PlanetWidget> {
  int currentIndex = 0;
 
  final _animationDuration = const Duration(milliseconds: 500);
 
  @override
  Widget build(BuildContext context) {
    Planet planet = widget.planets[currentIndex];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: _navigateToNextPlanet,
          child: AnimatedContainer(
            duration: _animationDuration,
            width: 350,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
              color: planet.backgroundColor,
            ),
            child: Center(
              child: AnimatedSize(
                duration: _animationDuration,
                child: SvgPicture.asset(
                  planet.svgAsset,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          planet.description,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _navigateToPreviousPlanet,
              icon: const Icon(Icons.arrow_back),
            ),

            const SizedBox(width: 20),
            ElevatedButton(
              onPressed: () {
                _playPlanetName(planet.name);
              },
              child: const Text('Play Sound'),
            ),
            const SizedBox(width: 20),
            IconButton(
              onPressed: _navigateToNextPlanet,
              icon: const Icon(Icons.arrow_forward),

            const SizedBox(height: 20),
            const Text(
              AppConstants.underConstruction,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),

            ),
          ],
        ),
      ],
    );
  }
 
  void _navigateToNextPlanet() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.planets.length;
    });
  }
 
  void _navigateToPreviousPlanet() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + widget.planets.length) % widget.planets.length;
    });
  }
 
  Future<void> _playPlanetName(String name) async {
    await widget.flutterTts.setLanguage("en-US");
    await widget.flutterTts.speak(name);
  }
}