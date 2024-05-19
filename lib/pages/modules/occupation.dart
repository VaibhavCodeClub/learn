import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learn/models/occupation_model.dart';
import 'package:learn/utils/constants.dart';

class OccupationPage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();
  OccupationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Occupations',
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
        child: OccupationWidget(
          occupations: AppConstants.occupations,
          flutterTts: flutterTts,
          audioPlayer: audioPlayer,
        ),
      ),
    );
  }
}

class OccupationWidget extends StatefulWidget {
  final List<Occupation> occupations;
  final FlutterTts flutterTts;
  final AudioPlayer audioPlayer;
  const OccupationWidget({
    super.key,
    required this.occupations,
    required this.flutterTts,
    required this.audioPlayer,
  });

  @override
  State<OccupationWidget> createState() => _OccupationWidgetState();
}

class _OccupationWidgetState extends State<OccupationWidget> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    Occupation occupation = widget.occupations[currentIndex];
    return Column(
      children: [
        const SizedBox(height: 10.0),
        Container(
          width: 350,
          height: MediaQuery.of(context).size.height / 2,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
            borderRadius: BorderRadius.circular(8.0),
            color: occupation.backgroundColor,
          ),
          child: AnimatedSize(
            duration: const Duration(milliseconds: 500),
            child: SvgPicture.asset(
              occupation.svgAsset,
              fit: BoxFit.contain,
            ),
          ),
        ),
        const SizedBox(height: 20.0),
        Text(
          occupation.name,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 10.0),
        Padding(
          padding: const EdgeInsets.only(
            right: 8.0,
            left: 8.0,
          ),
          child: Text(
            occupation.description,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 22.0,
            ),
          ),
        ),
        const SizedBox(height: 30.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: _previousOccupation,
              icon: const Icon(Icons.arrow_back),
            ),
            const SizedBox(width: 20.0),
            ElevatedButton(
              onPressed: () {
                _playOccupationName(occupation.name);
              },
              child: const Text("Play Sound"),
            ),
            const SizedBox(width: 20.0),
            IconButton(
              onPressed: _nextOccupation,
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ],
    );
  }

  _nextOccupation() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.occupations.length;
    });
  }

  _previousOccupation() {
    setState(() {
      currentIndex = (currentIndex - 1 + widget.occupations.length) %
          widget.occupations.length;
    });
  }

  Future<void> _playOccupationName(String name) async {
    await widget.flutterTts.setLanguage('en-US');
    await widget.flutterTts.speak(name);
  }
}
