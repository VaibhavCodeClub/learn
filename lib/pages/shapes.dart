import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/utils/constants.dart';
import 'package:learn/widgets/drawer.dart';

class Shapes {
  final String name;
  final String svgAsset;

  Shapes({
    required this.name,
    required this.svgAsset,
  });
}

class Lines {
  final String name;
  final String svgAsset;

  Lines({
    required this.name,
    required this.svgAsset,
  });
}

class ShapesPage extends StatefulWidget {
  const ShapesPage({Key? key}) : super(key: key);

  @override
  _ShapesPageState createState() => _ShapesPageState();
}

class _ShapesPageState extends State<ShapesPage> {
  final List<Shapes> shapes = [
    Shapes(
      name: 'Circle',
      svgAsset: '- assets/shapesandlines/circle.svg',
    ),
    Shapes(
      name: 'Square',
      svgAsset: '- assets/shapesandlines/square.svg',
    ),
    Shapes(
      name: 'Triangle',
      svgAsset: 'assets/shapesandlines/triangle.svg',
    ),
    
  ];

  final List<Lines> lines = [
    Lines(
      name: 'Straight Line',
      svgAsset: 'assets/shapesandlines/straight_line.svg',
    ),
    Lines(
      name: 'Curved Line',
      svgAsset: 'assets/shapesandlines/curved_line.svg',
    ),
    Lines(
      name: 'Dotted Line',
      svgAsset: 'assets/shapesandlines/dotted_line.svg',
    ),

  ];

  final FlutterTts flutterTts = FlutterTts();
  int currentIndex = 0;

  void _navigateToNextItem(List list) {
    setState(() {
      currentIndex = (currentIndex + 1) % list.length;
    });
  }

  void _navigateToPreviousItem(List list) {
    setState(() {
      currentIndex = (currentIndex - 1 + list.length) % list.length;
    });
  }

  Future<void> readName(String name) async {
    await flutterTts.setLanguage("EN-IN");
    await flutterTts.speak(name);
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> items = currentIndex < shapes.length ? shapes : lines;
    var currentItem = items[currentIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          currentIndex < shapes.length
              ? AppConstants.shape
              : AppConstants.shape,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 187, 238),
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
                onTap: () => _navigateToNextItem(items),
                child: Container(
                  width: double.infinity,
                  height: 300,
                  child: SvgPicture.asset(
                    currentItem.svgAsset,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                currentItem.name,
                style: TextStyle(
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
                    onPressed: () => _navigateToPreviousItem(items),
                    icon: const Icon(
                      Icons.arrow_back,
                      size: 30,
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton.outlined(
                    highlightColor: Colors.amber,
                    onPressed: () {
                      readName(currentItem.name);
                    },
                    icon: const Icon(
                      Icons.volume_up_outlined,
                      size: 40,
                    ),
                  ),
                  const SizedBox(width: 20),
                  IconButton(
                    onPressed: () => _navigateToNextItem(items),
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
      drawer: const MyDrawer(),
    );
  }
}
