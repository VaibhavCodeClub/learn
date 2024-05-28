import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:learn/pages/about.dart';
import 'package:learn/pages/explore/quiz.dart';
import 'package:learn/pages/modules/atoz.dart';
import 'package:learn/pages/modules/birds.dart';
import 'package:learn/pages/modules/animals.dart';
import 'package:learn/pages/explore.dart';
import 'package:learn/pages/favorite.dart';
import 'package:learn/pages/modules/flowers.dart';
import 'package:learn/pages/modules/greetings.dart';
import 'package:learn/pages/modules/occupation.dart';
import 'package:learn/pages/modules/parts.dart';
import 'package:learn/pages/modules/seasons.dart';
import 'package:learn/pages/modules/shapes.dart';
import 'package:learn/pages/modules/planets.dart';
import 'package:learn/utils/routes.dart';
import 'package:learn/pages/modules/colours.dart';
import 'package:learn/widgets/navbar/navbar.dart';

import 'cubit/index_cubit.dart';
import 'pages/home.dart';

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
      builder: (theme, darkTheme) => BlocProvider(
        create: (context) => IndexCubit(),
        child: BlocBuilder<IndexCubit, int>(
          builder: (context, index) {
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Home',
              theme: theme,
              darkTheme: darkTheme,
              home: Scaffold(
                body: const [
                  MyHomePage(),
                  ExplorePage(),
                  FavoritePage(),
                  AboutPage(),
                ][index],
                bottomNavigationBar: const BottomNavBar(),
              ),
              routes: {
                AllRoutes.homeRoute: (context) => const MyHomePage(),
                AllRoutes.atozRoute: (context) => const AtoZ(),
                AllRoutes.birdsRoute: (context) => BirdsPage(),
                AllRoutes.shapesRoute: (context) => const ShapesPage(),
                AllRoutes.partsRoute: (context) => const PartsPage(),
                AllRoutes.solarRoute: (context) => PlanetsPage(),
                AllRoutes.animalRoute: (context) => AnimalsPage(),
                AllRoutes.colourRoute: (context) => const ColoursPage(),
                AllRoutes.aboutRoute: (context) => const AboutPage(),
                AllRoutes.flowerRoute: (context) => const FlowerPage(),
                AllRoutes.exploreRoute: (context) => const ExplorePage(),
                AllRoutes.favoriteRoute: (context) => const FavoritePage(),
                AllRoutes.quizRoute: (context) => QuizPage(),
                AllRoutes.seasonRoute: (context) => SeasonsPage(),
                AllRoutes.occupationRoute: (context) => OccupationPage(),
                AllRoutes.greetingsRoute:(context) => GreetingsPage(),
              },
            );
          },
        ),
      ),
    );
  }
}
