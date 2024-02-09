import 'package:flutter/material.dart';
import 'package:learn/widgets/drawer.dart';

class PartsPage extends StatelessWidget {
  const PartsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Body Parts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 174, 236, 219),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/hand.gif',
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
