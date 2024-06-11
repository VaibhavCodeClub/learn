// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learn/utils/constants.dart';
import '../../utils/const_dimensions.dart';
import 'package:learn/models/planet_model.dart';

class PlanetsPage extends StatelessWidget {

  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();

  PlanetsPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        child: Center(
          child: PlanetWidget(
            planets: AppConstants.planets,
            flutterTts: flutterTts,
            audioPlayer: audioPlayer,
          ),
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
            width: ConstantDimensions.widthExtraLarge * 7,
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
        const SizedBox(height: ConstantDimensions.heightMedium),
        Text(
          planet.description,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: ConstantDimensions.heightMedium),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _navigateToPreviousPlanet,
              icon: const Icon(Icons.arrow_back),
            ),
            const SizedBox(width: ConstantDimensions.widthMedium),
            ElevatedButton(
              onPressed: () {
                _playPlanetName(planet.name);
              },
              child: const Text('Play Sound'),
            ),
            const SizedBox(width: ConstantDimensions.widthMedium),
            IconButton(
              onPressed: _navigateToNextPlanet,
              icon: const Icon(Icons.arrow_forward),
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
