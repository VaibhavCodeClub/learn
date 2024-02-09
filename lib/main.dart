import 'package:flutter/material.dart';
import 'package:learn/pages/atoz.dart';
import 'package:learn/pages/birds.dart';
import 'package:learn/pages/home.dart';
import 'package:learn/pages/animals.dart';
import 'package:learn/pages/parts.dart';
import 'package:learn/pages/shapes.dart';
import 'package:learn/pages/solar.dart';
import 'package:learn/utils/routes.dart';
import 'package:learn/widgets/theme.dart';
import 'package:learn/pages/about.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyTheme.lightTheme(context),
      initialRoute: AllRoutes.homeRoute,
      routes: {
        AllRoutes.homeRoute: (context) => const Home(),
        AllRoutes.animalRoute: (context) => AnimalsPage(),
        AllRoutes.atozRoute: (context) => const AtoZ(),
        AllRoutes.birdsRoute: (context) => const BirdsPage(),
        AllRoutes.shapesRoute: (context) => const ShapesPage(),
        AllRoutes.partsRoute: (context) =>  const PartsPage(),
        AllRoutes.solarRoute: (context) => const SolarPage(),
        AllRoutes.aboutRoute: (context) => const AboutPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
