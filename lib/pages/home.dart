import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:learn/utils/assets_path.dart';
import 'package:learn/utils/const_dimensions.dart';
import 'package:learn/utils/route/route_constant.dart';
import 'package:provider/provider.dart';
import '../widgets/drawer.dart';
import '../theme_provider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<bool> _isImageClicked = List.generate(7, (index) => false);

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16, top: 1),
            child: IconButton(
              icon: Icon(
                themeProvider.themeMode == ThemeMode.dark ? Icons.dark_mode : Icons.light_mode,
              ),
              onPressed: () {
                themeProvider.toggleTheme();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: Column(
            children: [
              categoryCard(
                context: context,
                title: "ALPHABETS",
                image: AssetsPath.getAlphabetImage(Alphabets.alphabets),
                shortDescription: "Learn A to Z with pronunciation and an example",
                route: AllRoutesConstant.atozRoute,
                index: 0,
              ),
              const SizedBox(
                height: ConstantDimensions.heightMedium,
              ),
              categoryCard(
                context: context,
                title: "ANIMALS",
                image: AssetsPath.getAnimalImage(Animals.animals),
                shortDescription: "Learn about animals and their voices",
                route: AllRoutesConstant.animalRoute,
                index: 1,
              ),
              const SizedBox(
                height: ConstantDimensions.heightMedium,
              ),
              categoryCard(
                context: context,
                title: "BODY PARTS",
                image: AssetsPath.getBodyImage(Body.body),
                shortDescription: "Know about body parts and their pronunciation.",
                route: AllRoutesConstant.partsRoute,
                index: 2,
              ),
              const SizedBox(
                height: ConstantDimensions.heightMedium,
              ),
              categoryCard(
                context: context,
                title: "BIRDS",
                image: AssetsPath.getBirdImage(Birds.birds),
                shortDescription: "Look out for Birds with their sounds.",
                route: AllRoutesConstant.birdsRoute,
                index: 3,
              ),
              const SizedBox(
                height: ConstantDimensions.heightMedium,
              ),
              categoryCard(
                context: context,
                title: "COLOURS",
                image: AssetsPath.getColoursImage(ColorImages.colorsCover),
                shortDescription: "Explore and learn about the colours!",
                route: AllRoutesConstant.colourRoute,
                index: 4,
              ),
              const SizedBox(
                height: ConstantDimensions.heightMedium,
              ),
              categoryCard(
                context: context,
                title: "FLOWERS",
                image: AssetsPath.getFlowerImage(Flowers.flowerBanner),
                shortDescription: "Explore beauty of nature flowers.",
                route: AllRoutesConstant.flowerRoute,
                index: 5,
              ),
              const SizedBox(
                height: ConstantDimensions.heightMedium,
              ),
              categoryCard(
                context: context,
                title: "FRUITS & VEGETABLES",
                image: 'assets/fruitsVeges/cover.jpg',
                shortDescription: "Explore and learn about Fruits and Vegetables!",
                route: AllRoutesConstant.fruitRoute,
                index: 6,
              ),
            ],
          ),
        ),
      ),
      drawer: const MyDrawer(),
    );
  }

  Column categoryCard({
    required BuildContext context,
    required String title,
    required String image,
    required String shortDescription,
    required String route,
    required int index,
  }) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              _isImageClicked[index] = !_isImageClicked[index];
            });
            Future.delayed(const Duration(milliseconds: 300), () {
              Navigator.pushNamed(context, route);
            });
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
            height: _isImageClicked[index]
                ? ConstantDimensions.heightSmallImage
                : ConstantDimensions.heightBigImage,
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
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: ConstantDimensions.heightMedium),
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
        Text(shortDescription),
      ],
    );
  }
}
