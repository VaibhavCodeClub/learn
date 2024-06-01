import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn/models/flower_model.dart';
import 'package:learn/utils/assets_path.dart';

// import '../../utils/const_dimensions.dart';

class FlowerPage extends StatefulWidget {
  const FlowerPage({super.key});

  @override
  State<FlowerPage> createState() => _FlowerPageState();
}

class _FlowerPageState extends State<FlowerPage> {
  final List<Flower> flowers = [
    Flower(
        name: "Rose",
        resource: AssetsPath.getFlowerImage(Flowers.rose),
        background: Colors.red.shade600),
    Flower(
        name: "Sunflower",
        resource: AssetsPath.getFlowerImage(Flowers.sunflower),
        background: Colors.yellow.shade700),
    Flower(
        name: "Lily",
        resource: AssetsPath.getFlowerImage(Flowers.lily),
        background: Colors.green.shade300),
    Flower(
        name: "Marigold",
        resource: AssetsPath.getFlowerImage(Flowers.marigold),
        background: Colors.orange.shade600),
    Flower(
        name: "Dandelion",
        resource: AssetsPath.getFlowerImage(Flowers.dandelion),
        background: Colors.green.shade600),
    Flower(
        name: "Lotus",
        resource: AssetsPath.getFlowerImage(Flowers.lotus),
        background: Colors.pink.shade300),
    Flower(
        name: "Daisy",
        resource: AssetsPath.getFlowerImage(Flowers.daisy),
        background: Colors.brown.shade400),
    Flower(
        name: "Jasmine",
        resource: AssetsPath.getFlowerImage(Flowers.jasmine),
        background: Colors.green.shade600),
    Flower(
        name: "Tulip",
        resource: AssetsPath.getFlowerImage(Flowers.tulip),
        background: Colors.pink.shade400),
    Flower(
        name: "Lavender",
        resource: AssetsPath.getFlowerImage(Flowers.lavender),
        background: Colors.purple.shade600),
    Flower(
        name: "Hibiscus",
        resource: AssetsPath.getFlowerImage(Flowers.hibiscus),
        background: Colors.pink.shade400),
  ];

  final FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;

  void _navigateToNextFlower() {
    setState(() {
      currentIndex = (currentIndex + 1) % flowers.length;
    });
  }

  void _navigateToPreviousFlower() {
    setState(() {
      currentIndex = (currentIndex - 1 + flowers.length) % flowers.length;
    });
  }

  Future<void> readName(String name) async {
    await flutterTts.setVolume(1.0);
    await flutterTts.setLanguage("EN-IN");
    await flutterTts.setPitch(1.0);
    await flutterTts.speak(name);
  }

  @override
  Widget build(BuildContext context) {
    Flower flower = flowers[currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Flowers',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
        ),
      ),
      backgroundColor: flower.background,

      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(20),
              constraints: const BoxConstraints(maxWidth: 400, maxHeight: 700),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.7),
                borderRadius: BorderRadius.circular(7.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 5,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: _navigateToNextFlower,
                    child: Container(
                      width: double.infinity,
                      height: 300,
                      child: SvgPicture.asset(
                        flower.resource,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    flower.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 60,
                      fontFamily: 'Comic',
                      color: flower.background,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        onPressed: _navigateToPreviousFlower,
                        icon: const Icon(
                          Icons.arrow_back,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton.outlined(
                        highlightColor: Colors.amber,
                        onPressed: () {
                          readName(flower.name);
                        },
                        icon: const Icon(
                          Icons.volume_up_outlined,
                          size: 40,
                        ),
                      ),
                      const SizedBox(width: 20),
                      IconButton(
                        onPressed: _navigateToNextFlower,
                        icon: const Icon(
                          Icons.arrow_forward,
                          size: 30,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
