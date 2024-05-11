import 'package:flutter/material.dart';
import 'package:learn/utils/constants.dart';
import 'package:learn/widgets/drawer.dart';

class SolarPage extends StatelessWidget {
  const SolarPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.solar,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 29, 29, 29),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/solar.gif',
            ),
            const SizedBox(height: 20),
            const Text(
              AppConstants.underConstruction,
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
