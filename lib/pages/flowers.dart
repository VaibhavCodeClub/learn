import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn/utils/assets_path.dart';


class Flower{
  final String name;
  final String resource;
  final Color background;

  Flower({required this.name,required this.resource,required this.background});
}


class FlowerPage extends StatefulWidget {
  const FlowerPage({super.key});

  @override
  State<FlowerPage> createState() => _FlowerPageState();
}

class _FlowerPageState extends State<FlowerPage> {

  final List<Flower> flowers = [
    Flower(name: "Rose", resource: AssetsPath.getFlowerImage("rose.svg"), background: Colors.redAccent),
    Flower(name: "Sunflower", resource: AssetsPath.getFlowerImage("sunflower.svg"), background: Colors.yellowAccent),
    Flower(name: "Lily", resource: AssetsPath.getFlowerImage("lily.svg"), background: Colors.greenAccent),
    Flower(name: "Marigold", resource: AssetsPath.getFlowerImage("marigold.svg"), background: Colors.yellow),
    Flower(name: "Carnation", resource: AssetsPath.getFlowerImage("carnation.svg"), background: Colors.redAccent),
    Flower(name: "Daffodil", resource: AssetsPath.getFlowerImage("daffodil.svg"), background: Colors.purpleAccent),
    Flower(name: "Daisy", resource: AssetsPath.getFlowerImage("daisy.svg"), background: Colors.green),
    Flower(name: "Poppy", resource: AssetsPath.getFlowerImage("poppy.svg"), background: Colors.redAccent),
    Flower(name: "Tulip", resource: AssetsPath.getFlowerImage("tulip.svg"), background: Colors.pink),
    Flower(name: "Lavender", resource: AssetsPath.getFlowerImage("lavender.svg"), background: Colors.purple),
    Flower(name: "Hibiscus", resource: AssetsPath.getFlowerImage("hibiscus.svg"), background: Colors.red),

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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 60,
                  fontFamily: 'Comic',
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
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
