// ignore_for_file: library_private_types_in_public_api, use_key_in_widget_constructors, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:just_audio/just_audio.dart';
import 'package:learn/utils/constants.dart';
import 'package:learn/utils/functions.dart';

import '../utils/const_dimensions.dart';

class Fruit {
  final String name;
  final String svgAsset;
  final bool isfruit;
  final Color backgroundColor;

  Fruit({
    required this.name,
    required this.isfruit,
    required this.svgAsset,
    required this.backgroundColor,
  });
}

class FruitsPage extends StatefulWidget {
  FruitsPage({Key? key}) : super(key: key);

  @override
  State<FruitsPage> createState() => _FruitsPageState();
}

class _FruitsPageState extends State<FruitsPage> {
  final FlutterTts flutterTts = FlutterTts();
  int _currentIndex = 0;

  final AudioPlayer audioPlayer = AudioPlayer();
  Color? bgColor;
  @override
  void initState() {
    bgColorInit();
    super.initState();
  }

  void bgColorInit() {
    Future.delayed(Duration.zero).then((value) {
      bgColor = Theme.of(context).brightness == Brightness.dark
          ? Colors.black
          : Colors.white;
    }).then((value) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text(
          AppConstants.fruit,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _navigateToNextBird,
              child: Container(
                width: ConstantDimensions.exceptions[1],
                height: ConstantDimensions.exceptions[1],
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(8.0),
                  color: AppConstants.Fruits[_currentIndex].backgroundColor,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: ConstantDimensions.widthExtraLarge * 7,
                      height: ConstantDimensions.heightExtraLarge * 7,
                      child: SvgPicture.asset(
                          AppConstants.Fruits[_currentIndex].svgAsset),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: ConstantDimensions.heightMedium),
            IconButton.outlined(
              onPressed: () {
                AppFunctions().readName(
                  AppConstants.Fruits[_currentIndex].name,
                );
              },
              icon: const Icon(Icons.volume_up_outlined),
            ),
            Text(
              AppConstants.Fruits[_currentIndex].name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 60,
                fontFamily: 'Comic',
              ),
            ),
            const SizedBox(height: ConstantDimensions.heightMedium),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: _navigateToPrevBird,
                  icon: const Icon(Icons.arrow_back),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width * .3, 50))),
                  onPressed: () {
                    if (AppConstants.Fruits[_currentIndex].isfruit == true) {
                      bgColor = Colors.green;
                      setState(() {});
                    } else {
                      bgColor = Colors.red;
                      setState(() {});
                    }
                    // _playBirdSound(bird.soundAsset);
                  },
                  child: const Text('Fruit'),
                ),
                ElevatedButton(
                  style: ButtonStyle(
                      fixedSize: MaterialStateProperty.all(
                          Size(MediaQuery.of(context).size.width * .3, 50))),
                  onPressed: () {
                    if (AppConstants.Fruits[_currentIndex].isfruit == false) {
                      bgColor = Colors.green;
                      setState(() {});
                    } else {
                      bgColor = Colors.red;
                      setState(() {});
                    }
                  },
                  child: const Text('Vegetable'),
                ),
                IconButton(
                  onPressed: _navigateToNextBird,
                  icon: const Icon(Icons.arrow_forward),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToNextBird() {
    setState(() {
      _currentIndex = (_currentIndex + 1) % AppConstants.Fruits.length;
    });
    bgColorInit();
  }

  void _navigateToPrevBird() {
    setState(() {
      _currentIndex = (_currentIndex - 1) % AppConstants.Fruits.length;
    });
    bgColorInit();
  }
}

class WidgetStateProperty {
  static all(Size size) {}
}
