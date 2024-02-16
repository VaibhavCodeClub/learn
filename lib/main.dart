import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:learn/pages/about.dart';
import 'package:learn/pages/atoz.dart';
import 'package:learn/pages/birds.dart';
import 'package:learn/pages/animals.dart';
import 'package:learn/pages/parts.dart';
import 'package:learn/pages/shapes.dart';
import 'package:learn/pages/solar.dart';
import 'package:learn/utils/routes.dart';
import 'package:learn/widgets/drawer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  runApp(MyApp(savedThemeMode: savedThemeMode));
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData.light(),
      dark: ThemeData.dark(),
      initial: savedThemeMode ?? AdaptiveThemeMode.light,
      builder: (theme, darkTheme) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Your App Title',
        theme: theme,
        darkTheme: darkTheme,
        home: MyHomePage(),
        routes: {
          AllRoutes.homeRoute: (context) => MyHomePage(),
          AllRoutes.atozRoute: (context) => const AtoZ(),
          AllRoutes.birdsRoute: (context) => const BirdsPage(),
          AllRoutes.shapesRoute: (context) => const ShapesPage(),
          AllRoutes.partsRoute: (context) => const PartsPage(),
          AllRoutes.solarRoute: (context) => const SolarPage(),
          AllRoutes.animalRoute: (context) => AnimalsPage(),
          AllRoutes.aboutRoute: (context) => const AboutPage(),
          // Define other routes as well
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool _isImageClicked1 = false;
  bool _isImageClicked2 = false;
  bool _isImageClicked3 = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.lightbulb_outline),
            onPressed: () {
              final themeMode = Theme.of(context).brightness == Brightness.dark
                  ? AdaptiveThemeMode.light
                  : AdaptiveThemeMode.dark;
              AdaptiveTheme.of(context).setThemeMode(themeMode);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageClicked1 = !_isImageClicked1;
                  });
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Navigator.pushNamed(context, AllRoutes.atozRoute);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isImageClicked1 ? 325 : 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/alphabets.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'ALPHABETS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text("Learn A to Z with pronunciation and an example"),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageClicked2 = !_isImageClicked2;
                  });
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Navigator.pushNamed(context, AllRoutes.animalRoute);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isImageClicked2 ? 325 : 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/images/animals.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'ANIMALS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text("Learn about animals and their voices"),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isImageClicked3 = !_isImageClicked3;
                  });
                  Future.delayed(const Duration(milliseconds: 300), () {
                    Navigator.pushNamed(context, AllRoutes.partsRoute);
                  });
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  height: _isImageClicked3 ? 325 : 350,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: const Offset(0, 3),
                      ),
                    ],
                    image: const DecorationImage(
                      image: AssetImage('assets/body/body.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'BODY PARTS',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const Text("Know about body parts and their pronunciation."),
            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }
}
