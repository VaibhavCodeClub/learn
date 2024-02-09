import 'package:flutter/material.dart';
import 'package:learn/widgets/drawer.dart';

class BirdsPage extends StatelessWidget {
  const BirdsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Birds',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 0, 187, 238),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/loading.gif',
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
