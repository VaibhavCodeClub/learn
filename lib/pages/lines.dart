// shapes&lines.dart
import 'package:flutter/material.dart';

class LinesPage extends StatelessWidget {
  const LinesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shapes & Lines'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Learn Shapes & Lines',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            // Add widgets for different shapes and lines
            // Can include circles, squares, triangles, lines, etc.
          ],
        ),
      ),
    );
  }
}
  