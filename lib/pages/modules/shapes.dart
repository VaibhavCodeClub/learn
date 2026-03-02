import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/utils/constants.dart';

class ShapeData {
  final String name;
  final String svgPath;
  final String id;

  ShapeData({required this.name, required this.svgPath, required this.id});
}

class ShapesPage extends StatefulWidget {
  const ShapesPage({Key? key}) : super(key: key);

  @override
  State<ShapesPage> createState() => _ShapesPageState();
}

class _ShapesPageState extends State<ShapesPage> {
  final List<ShapeData> allShapes = [
    ShapeData(
        name: 'Circle', svgPath: 'assets/shapes/circle.svg', id: 'circle'),
    ShapeData(
        name: 'Square', svgPath: 'assets/shapes/square.svg', id: 'square'),
    ShapeData(
        name: 'Triangle',
        svgPath: 'assets/shapes/triangle.svg',
        id: 'triangle'),
    ShapeData(
        name: 'Rectangle',
        svgPath: 'assets/shapes/rectangle.svg',
        id: 'rectangle'),
    ShapeData(name: 'Star', svgPath: 'assets/shapes/star.svg', id: 'star'),
    ShapeData(name: 'Heart', svgPath: 'assets/shapes/heart.svg', id: 'heart'),
    ShapeData(
        name: 'Diamond', svgPath: 'assets/shapes/diamond.svg', id: 'diamond'),
    ShapeData(
        name: 'Pentagon',
        svgPath: 'assets/shapes/pentagon.svg',
        id: 'pentagon'),
    ShapeData(
        name: 'Hexagon', svgPath: 'assets/shapes/hexagon.svg', id: 'hexagon'),
    ShapeData(name: 'Oval', svgPath: 'assets/shapes/oval.svg', id: 'oval'),
  ];

  List<PlaygroundShape> playgroundShapes = [];
  ShapeData? currentTargetShape;
  int remainingCount = 0;
  bool gameWon = false;
  final Random random = Random();

  @override
  void initState() {
    super.initState();
    _startGame();
  }

  void _startGame() {
    setState(() {
      gameWon = false;
      playgroundShapes.clear();

      // Generate 20-30 random shapes in the playground
      int totalShapes = 20 + random.nextInt(11);

      for (int i = 0; i < totalShapes; i++) {
        ShapeData shape = allShapes[random.nextInt(allShapes.length)];
        playgroundShapes.add(PlaygroundShape(
          shapeData: shape,
          position: Offset(
            random.nextDouble() * 0.8,
            random.nextDouble() * 0.8,
          ),
          size: 40 + random.nextDouble() * 30,
          rotation: random.nextDouble() * 2 * pi,
        ));
      }

      _selectNextTarget();
    });
  }

  void _selectNextTarget() {
    if (playgroundShapes.isEmpty) {
      setState(() {
        gameWon = true;
      });
      return;
    }

    // Pick a random shape type from remaining shapes
    final availableTypes =
        playgroundShapes.map((s) => s.shapeData.id).toSet().toList();
    final targetId = availableTypes[random.nextInt(availableTypes.length)];

    setState(() {
      currentTargetShape = allShapes.firstWhere((s) => s.id == targetId);
      remainingCount =
          playgroundShapes.where((s) => s.shapeData.id == targetId).length;
    });
  }

  void _onShapeTapped(int index) {
    if (playgroundShapes[index].shapeData.id == currentTargetShape?.id) {
      setState(() {
        playgroundShapes.removeAt(index);
        remainingCount--;

        if (remainingCount == 0) {
          _selectNextTarget();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.shape,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: gameWon ? _buildWinScreen() : _buildGameScreen(),
    );
  }

  Widget _buildGameScreen() {
    return Column(
      children: [
        // Target display area
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              const Text(
                'Find and tap all:',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              if (currentTargetShape != null) ...[
                SvgPicture.asset(
                  currentTargetShape!.svgPath,
                  width: 80,
                  height: 80,
                ),
                const SizedBox(height: 10),
                Text(
                  currentTargetShape!.name,
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Remaining: $remainingCount',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.red,
                  ),
                ),
              ],
            ],
          ),
        ),

        // Playground area
        Expanded(
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: LayoutBuilder(
              builder: (context, constraints) {
                return Stack(
                  children: playgroundShapes.asMap().entries.map((entry) {
                    int index = entry.key;
                    PlaygroundShape shape = entry.value;

                    return Positioned(
                      left: shape.position.dx * constraints.maxWidth,
                      top: shape.position.dy * constraints.maxHeight,
                      child: GestureDetector(
                        onTap: () => _onShapeTapped(index),
                        child: Transform.rotate(
                          angle: shape.rotation,
                          child: SvgPicture.asset(
                            shape.shapeData.svgPath,
                            width: shape.size,
                            height: shape.size,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWinScreen() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.purple.shade300, Colors.blue.shade300],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.emoji_events,
              size: 120,
              color: Colors.amber,
            ),
            const SizedBox(height: 20),
            const Text(
              'You Won!',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            const Text(
              '🎉 Great Job! 🎉',
              style: TextStyle(
                fontSize: 28,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: _startGame,
                  icon: const Icon(Icons.replay),
                  label: const Text('Play Again'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                ),
                const SizedBox(width: 20),
                ElevatedButton.icon(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.arrow_back),
                  label: const Text('Go Back'),
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(fontSize: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PlaygroundShape {
  final ShapeData shapeData;
  final Offset position;
  final double size;
  final double rotation;

  PlaygroundShape({
    required this.shapeData,
    required this.position,
    required this.size,
    required this.rotation,
  });
}
