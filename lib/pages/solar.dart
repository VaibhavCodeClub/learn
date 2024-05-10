import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learn/main.dart';

void main() {
  runApp(MaterialApp(
    title: 'Planets App',
    initialRoute: '/',
    routes: {
      '/': (context) => const MyHomePage(),
      '/planets': (context) => PlanetsPage(),
    },
  ));
}

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

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, '/planets');
          },
          child: const Text('Go to Planets'),
        ),
      ),
    );
  }
}

class PlanetsPage extends StatelessWidget {
  final List<Planet> planets = [
    Planet(
      name: 'Sun',
      svgAsset: 'assets/solar/sun.png',
      description: 'Sun is the biggest star in the solar system.',
      backgroundColor: const Color.fromARGB(255, 208, 211, 23),
    ),
    Planet(
      name: 'Mercury',
      svgAsset: 'assets/solar/mercury.png',
      description: 'Mercury is the closest planet to the Sun.',
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
    ),
    Planet(
      name: 'Venus',
      svgAsset: 'assets/solar/venus.png',
      description: 'Venus is known for its thick atmosphere.',
      backgroundColor: const Color.fromARGB(255, 240, 193, 95),
    ),
    Planet(
      name: 'Earth',
      svgAsset: 'assets/solar/earth.png',
      description: 'Earth is the third planet from the Sun.',
      backgroundColor: const Color.fromARGB(255, 81, 149, 192),
    ),
    Planet(
      name: 'Mars',
      svgAsset: 'assets/solar/mars.png',
      description: 'Mars is often called the Red Planet.',
      backgroundColor: const Color.fromARGB(255, 238, 118, 96),
    ),
    Planet(
      name: 'Jupiter',
      svgAsset: 'assets/solar/jupiter.png',
      description: 'Jupiter is the largest planet in our solar system.',
      backgroundColor: const Color.fromARGB(255, 204, 164, 122),
    ),
    Planet(
      name: 'Saturn',
      svgAsset: 'assets/solar/saturn.png',
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
      svgAsset: 'assets/solar/neptune.png',
      description: 'Neptune is the farthest planet from the Sun.',
      backgroundColor: const Color.fromARGB(255, 64, 90, 200),
    ),
  ];

  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();

  PlanetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Solar System',
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

  const PlanetWidget({super.key, 
    required this.planets,
    required this.flutterTts,
    required this.audioPlayer,
  });

  @override
  
  _PlanetWidgetState createState() => _PlanetWidgetState();
}

class _PlanetWidgetState extends State<PlanetWidget> {
  int currentIndex = 0;

  final _animationDuration = const Duration(milliseconds: 500);

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
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.6,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              borderRadius: BorderRadius.circular(8.0),
              color: planet.backgroundColor,
            ),
            child: Center(
              child: AnimatedSize(
                duration: _animationDuration,
                child: Image.asset(
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
            ),
          ],
        ),
      ],
    );
  }

  Future<void> _playPlanetName(String name) async {
    await widget.flutterTts.setLanguage("en-US");
    await widget.flutterTts.speak(name);
  }
}
