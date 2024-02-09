import 'package:flutter/material.dart';
import 'package:learn/pages/atoz.dart';
import 'package:learn/pages/contact.dart';
import 'package:learn/pages/education.dart';
import 'package:learn/pages/experience.dart';
import 'package:learn/pages/home.dart';
import 'package:learn/pages/animals.dart';
import 'package:learn/pages/projects.dart';
import 'package:learn/pages/skills.dart';
import 'package:learn/utils/routes.dart';
import 'package:learn/widgets/theme.dart';

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
        AllRoutes.skillsRoute: (context) => SkillsPage(),
        AllRoutes.educationRoute: (context) => EducationPage(),
        AllRoutes.projectsRoute: (context) => const ProjectsPage(),
        AllRoutes.experienceRoute: (context) => const ExperiencePage(),
        AllRoutes.atozRoute: (context) => const AtoZ(),
        AllRoutes.contactRoute: (context) => const ContactPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
