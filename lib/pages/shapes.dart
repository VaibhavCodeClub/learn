import 'package:flutter/material.dart';
import 'package:learn/widgets/drawer.dart';

class ShapesPage extends StatelessWidget {
  const ShapesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Shapes',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 187, 238),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/shape.gif',
            ),
            const SizedBox(height: 20),
            const Text(
              'Page Under Construction.\nIt will not take much time.',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
