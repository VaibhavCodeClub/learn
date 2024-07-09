import 'package:flutter/material.dart';
import 'package:learn/landing_page.dart';
import 'package:learn/pages/about.dart';
import 'package:learn/pages/explore.dart';
import 'package:learn/pages/explore/quiz.dart';
import 'package:learn/pages/favorite.dart';
import 'package:learn/pages/fruits.dart';
import 'package:learn/pages/home.dart';
import 'package:learn/pages/main_home.dart';
import 'package:learn/pages/modules/animals.dart';
import 'package:learn/pages/modules/atoz.dart';
import 'package:learn/pages/modules/birds.dart';
import 'package:learn/pages/modules/colours.dart';
import 'package:learn/pages/modules/flowers.dart';
import 'package:learn/pages/modules/occupation.dart';
import 'package:learn/pages/modules/parts.dart';
import 'package:learn/pages/modules/planets.dart';
import 'package:learn/pages/modules/seasons.dart';
import 'package:learn/pages/modules/shapes.dart';
import 'package:learn/utils/route/page_transtion.dart';
import 'package:learn/utils/route/route_constant.dart';

class Routers {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AllRoutesConstant.homeRoute:
        return slidePageRoute(const MyHomePage());
      case AllRoutesConstant.exploreRoute:
        return slidePageRoute(const ExplorePage());
      case AllRoutesConstant.atozRoute:
        return slidePageRoute(const AtoZ());
      case AllRoutesConstant.birdsRoute:
        return slidePageRoute(BirdsPage());
      case AllRoutesConstant.shapesRoute:
        return slidePageRoute(const ShapesPage());
      case AllRoutesConstant.partsRoute:
        return slidePageRoute(const PartsPage());
      case AllRoutesConstant.solarRoute:
        return slidePageRoute(PlanetsPage());
      case AllRoutesConstant.animalRoute:
        return slidePageRoute(AnimalsPage());
      case AllRoutesConstant.colourRoute:
        return slidePageRoute(const ColoursPage());
      case AllRoutesConstant.aboutRoute:
        return slidePageRoute(const AboutPage());
      case AllRoutesConstant.flowerRoute:
        return slidePageRoute(const FlowerPage());
      case AllRoutesConstant.favoriteRoute:
        return slidePageRoute(const FavoritePage());
      case AllRoutesConstant.quizRoute:
        return slidePageRoute(const Quiz());
      case AllRoutesConstant.seasonRoute:
        return slidePageRoute(const SeasonsPage());
      case AllRoutesConstant.occupationRoute:
        return slidePageRoute(OccupationPage());
      case AllRoutesConstant.fruitRoute:
        return slidePageRoute(FruitsPage());
      case AllRoutesConstant.landingRoute:
        return slidePageRoute(const LandingPage());
        case AllRoutesConstant.mainhomeRoute:
        return slidePageRoute(const MainHome());


      default:
        return MaterialPageRoute(
          builder: (context) => const Scaffold(
            body: Center(
              child: Text('No route found'),
            ),
          ),
        );
    }
  }
}
