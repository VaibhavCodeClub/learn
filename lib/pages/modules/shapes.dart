import 'package:flutter/material.dart';
import 'package:learn/utils/constants.dart';
import 'package:learn/widgets/drawer.dart';

import '../../utils/const_dimensions.dart';

class ShapesPage extends StatelessWidget {
  const ShapesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.shape,
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
            const SizedBox(height: ConstantDimensions.heightMedium),
            const Text(
              AppConstants.underConstruction,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
