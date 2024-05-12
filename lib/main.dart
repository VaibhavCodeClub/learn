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
import 'package:learn/pages/colours.dart';
import 'package:fluttertoast/fluttertoast.dart';

DateTime? currentBackPressTime;

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
        title: 'Home',
        theme: theme,
        darkTheme: darkTheme,
        home: const MyHomePage(),
        routes: {
          AllRoutes.homeRoute: (context) => const MyHomePage(),
          AllRoutes.atozRoute: (context) => const AtoZ(),
          AllRoutes.birdsRoute: (context) => BirdsPage(),
          AllRoutes.shapesRoute: (context) => const ShapesPage(),
          AllRoutes.linesRoute: (context) => const ShapesPage(),
          AllRoutes.partsRoute: (context) => const PartsPage(),
          AllRoutes.solarRoute: (context) => PlanetsPage(),
          AllRoutes.animalRoute: (context) => AnimalsPage(),
          AllRoutes.colourRoute: (context) => const ColoursPage(),
          AllRoutes.aboutRoute: (context) => const AboutPage(),
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
  bool _isImageClicked4 = false;
  bool _isDarkTheme = false;

  Future<bool> _onBackPressed() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: "Press back again to exit",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      return Future.value(false);
    }
    return Future.value(true);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Home',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(
                _isDarkTheme ? Icons.dark_mode : Icons.light_mode,
              ),
              onPressed: () {
                setState(() {
                  _isDarkTheme = !_isDarkTheme;
                });
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
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isImageClicked4 = !_isImageClicked4;
                    });
                    Future.delayed(const Duration(milliseconds: 300), () {
                      Navigator.pushNamed(context, AllRoutes.birdsRoute);
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: _isImageClicked4 ? 325 : 350,
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
                        image: AssetImage('assets/images/birds.jpg'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'BIRDS',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text("Look out for Birds with their sounds."),

                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _isImageClicked4 = !_isImageClicked4;
                    });
                    Future.delayed(const Duration(milliseconds: 300), () {
                      Navigator.pushNamed(context, AllRoutes.colourRoute);
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                    height: _isImageClicked4 ? 325 : 350,
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
                        image: AssetImage('assets/images/colours/colors-cover.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'COLOURS',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const Text("Explore and learn about the colours!"),

              ],
            ),
          ),
        ),
        drawer: const MyDrawer(),
      ),
    );
  }
}
