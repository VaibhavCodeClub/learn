import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learn/utils/constants.dart';

class Transport {
  final String transportname;
  final String transportsvgAsset;
  final String transportdesc;
  final Color transportbackgroundColor;

  Transport({
    required this.transportname,
    required this.transportsvgAsset,
    required this.transportdesc,
    required this.transportbackgroundColor,
  });
}

class TransportPage extends StatelessWidget {
  final FlutterTts flutterTts = FlutterTts();
  final AudioPlayer audioPlayer = AudioPlayer();

  TransportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.transport,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: TransportWidget(
          transports: AppConstants.transports,
          flutterTts: flutterTts,
          audioPlayer: audioPlayer,
        ),
      ),
    );
  }
}

class TransportWidget extends StatefulWidget {
  final List<Transport> transports;
  final FlutterTts flutterTts;
  final AudioPlayer audioPlayer;

  TransportWidget({
    required this.transports,
    required this.flutterTts,
    required this.audioPlayer,
  });

  @override
  _TransportWidgetState createState() => _TransportWidgetState();
}

class _TransportWidgetState extends State<TransportWidget> {
  int currentIndex = 0;

  void _navigateToNextTransport() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.transports.length;
    });
  }

  void _navigateToPreviousTransport() {
    setState(() {
      currentIndex = (currentIndex - 1 + widget.transports.length) %
          widget.transports.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    Transport transport = widget.transports[currentIndex];
    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(13, 71, 161, 1),
            Colors.pink
          ])
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _navigateToNextTransport,
                child: Container(
                  width: 375,
                  height: 375,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    borderRadius: BorderRadius.circular(8.0),
                    color: transport.transportbackgroundColor,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 350,
                        height: 350,
                        child: SvgPicture.asset(transport.transportsvgAsset,fit: BoxFit.cover,),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // IconButton.outlined(
              //   highlightColor: Colors.amber,
              //   onPressed: () {
              //     readName(
              //       transport.transportname,
              //     );
              //   },
              //   icon: const Icon(Icons.volume_up_outlined),
              // ),
              Text(
                transport.transportname,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  fontFamily: 'Comic',
                ),
              ),
              const SizedBox(height: 20),
              Text(
                transport.transportdesc,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: _navigateToPreviousTransport,
                    child: const Text(
                      'Prev',
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold,color: Color.fromRGBO(179, 229, 252, 1)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  const SizedBox(width: 20),
                  TextButton(
                    onPressed: _navigateToNextTransport,
                    child: const Text(
                      'Next',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Color.fromRGBO(179, 229, 252, 1)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _playSound(String soundAsset) async {
    await widget.audioPlayer.setAsset(soundAsset);
    await widget.audioPlayer.play();
  }

  Future<void> readName(String name) async {
    await widget.flutterTts.setLanguage("EN-IN");
    await widget.flutterTts.speak(name);
  }
}
