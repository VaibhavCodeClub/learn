// ignore_for_file: non_constant_identifier_names, constant_identifier_names

import 'package:learn/models/animal_model.dart';
import 'package:learn/models/bird_model.dart';
import 'package:learn/models/fruit_model.dart';
import 'package:learn/models/itemdata_model.dart';
import 'package:learn/models/occupation_model.dart';
import 'package:learn/models/questions/question.dart';
import 'package:learn/models/season_model.dart';
// ignore: unused_import
import 'package:learn/models/number_model.dart';
import 'package:flutter/material.dart';
import 'package:learn/pages/fruits.dart';
import '../models/colours_model.dart';
import '../models/flower_model.dart';
import '../models/planet_model.dart';
import '../pages/explore/quiz.dart';
import 'package:learn/pages/modules/colours.dart';
import 'package:learn/pages/modules/parts.dart';
import 'package:learn/pages/modules/planets.dart';
import 'package:learn/pages/modules/shapes.dart';

import '../model/module.dart';
import 'package:learn/utils/assets_path.dart';

import '../pages/modules/animals.dart';
import '../pages/modules/atoz.dart';
import '../pages/modules/birds.dart';

class AppConstants {
  static List<Planet> planets = [
    Planet(
      name: 'Sun',
      svgAsset: AssetsPath.getSolarImage(SolarSystem.sun),
      description: 'Sun is the biggest star in the solar system.',
      backgroundColor: const Color.fromARGB(255, 208, 211, 23),
    ),
    Planet(
      name: 'Mercury',
      svgAsset: AssetsPath.getSolarImage(SolarSystem.mercury),
      description: 'Mercury is the closest planet to the Sun.',
      backgroundColor: const Color.fromARGB(255, 221, 221, 221),
    ),
    Planet(
      name: 'Venus',
      svgAsset: AssetsPath.getSolarImage(SolarSystem.venus),
      description: 'Venus is known for its thick atmosphere.',
      backgroundColor: const Color.fromARGB(255, 240, 193, 95),
    ),
    Planet(
      name: 'Earth',
      svgAsset: AssetsPath.getSolarImage(SolarSystem.earth),
      description: 'Earth is the third planet from the Sun.',
      backgroundColor: const Color.fromARGB(255, 81, 149, 192),
    ),
    Planet(
      name: 'Mars',
      svgAsset: AssetsPath.getSolarImage(SolarSystem.mars),
      description: 'Mars is often called the Red Planet.',
      backgroundColor: const Color.fromARGB(255, 238, 118, 96),
    ),
    Planet(
      name: 'Jupiter',
      svgAsset: AssetsPath.getSolarImage(SolarSystem.jupiter),
      description: 'Jupiter is the largest planet in our solar system.',
      backgroundColor: const Color.fromARGB(255, 204, 164, 122),
    ),
    Planet(
      name: 'Saturn',
      svgAsset: AssetsPath.getSolarImage(SolarSystem.saturn),
      description: 'Saturn is known for its beautiful rings.',
      backgroundColor: const Color.fromARGB(255, 229, 215, 194),
    ),
    Planet(
      name: 'Uranus',
      svgAsset: AssetsPath.getSolarImage(SolarSystem.uranus),
      description: 'Uranus is an ice giant with a unique rotation axis.',
      backgroundColor: const Color.fromARGB(255, 169, 222, 246),
    ),
    Planet(
      name: 'Neptune',
      svgAsset: AssetsPath.getSolarImage(SolarSystem.neptune),
      description: 'Neptune is the farthest planet from the Sun.',
      backgroundColor: const Color.fromARGB(255, 64, 90, 200),
    ),
  ];

  static List<Flower> flowers = [
    Flower(
        name: "Rose",
        resource: AssetsPath.getFlowerImage(Flowers.rose),
        background: Colors.redAccent),
    Flower(
        name: "Sunflower",
        resource: AssetsPath.getFlowerImage(Flowers.sunflower),
        background: Colors.yellowAccent),
    Flower(
        name: "Lily",
        resource: AssetsPath.getFlowerImage(Flowers.lily),
        background: Colors.greenAccent),
    Flower(
        name: "Marigold",
        resource: AssetsPath.getFlowerImage(Flowers.marigold),
        background: Colors.yellow),
    Flower(
        name: "Carnation",
        resource: AssetsPath.getFlowerImage(Flowers.carnation),
        background: Colors.redAccent),
    Flower(
        name: "Daffodil",
        resource: AssetsPath.getFlowerImage(Flowers.daffodil),
        background: Colors.purpleAccent),
    Flower(
        name: "Daisy",
        resource: AssetsPath.getFlowerImage(Flowers.daisy),
        background: Colors.green),
    Flower(
        name: "Poppy",
        resource: AssetsPath.getFlowerImage(Flowers.poppy),
        background: Colors.redAccent),
    Flower(
        name: "Tulip",
        resource: AssetsPath.getFlowerImage(Flowers.tulip),
        background: Colors.pink),
    Flower(
        name: "Lavender",
        resource: AssetsPath.getFlowerImage(Flowers.lavender),
        background: Colors.purple),
    Flower(
        name: "Hibiscus",
        resource: AssetsPath.getFlowerImage(Flowers.hibiscus),
        background: Colors.red),
  ];

  static List<Colours> colours = [
    Colours(
      name: 'Blue',
      jpgAsset: AssetsPath.getColoursImage(ColorImages.blue),
      bgColor: Colors.lightBlueAccent,
      fontColor: Colors.lightBlueAccent,
    ),
    Colours(
      name: 'Yellow',
      jpgAsset: AssetsPath.getColoursImage(ColorImages.yellow),
      bgColor: Colors.yellow.shade600,
      fontColor: Colors.yellow.shade600,
    ),
    Colours(
      name: 'Black',
      jpgAsset: AssetsPath.getColoursImage(ColorImages.black),
      bgColor: Colors.black,
      fontColor: Colors.black,
    ),
    Colours(
      name: 'Green',
      jpgAsset: AssetsPath.getColoursImage(ColorImages.green),
      bgColor: Colors.green,
      fontColor: Colors.green,
    ),
    Colours(
      name: 'Pink',
      jpgAsset: AssetsPath.getColoursImage(ColorImages.pink),
      bgColor: Colors.pink.shade300,
      fontColor: Colors.pink.shade300,
    ),
    Colours(
      name: 'White',
      jpgAsset: AssetsPath.getColoursImage(ColorImages.white),
      bgColor: Colors.grey.shade400,
      fontColor: Colors.grey.shade400,
    ),
    Colours(
      name: 'Red',
      jpgAsset: AssetsPath.getColoursImage(ColorImages.red),
      bgColor: Colors.red,
      fontColor: Colors.red,
    ),
    Colours(
      name: 'Violet',
      jpgAsset: AssetsPath.getColoursImage(ColorImages.violet),
      bgColor: Colors.deepPurple,
      fontColor: Colors.deepPurple,
    ),
    Colours(
      name: 'Brown',
      jpgAsset: AssetsPath.getColoursImage(ColorImages.brown),
      bgColor: const Color(0xFF964B00),
      fontColor: const Color(0xFF964B00),
    ),
    Colours(
      name: 'Orange',
      jpgAsset: AssetsPath.getColoursImage(ColorImages.orange),
      bgColor: Colors.orange,
      fontColor: Colors.orange,
    ),
  ];

  static List<Module> modules = [
    Module(
      name: 'Quiz',
      description: 'Fun Quizzes for Curious Kids!',
      thumbnailPath: "./assets/images/quiz.jpg",
      route: MaterialPageRoute(builder: (context) => const Quiz()),
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Module(
      name: 'A-Z',
      description: 'Learn A to Z with production and an example',
      thumbnailPath: AssetsPath.getAlphabetImage(Alphabets.alphabets),
      route: MaterialPageRoute(builder: (context) => const AtoZ()),
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Module(
      name: 'Number',
      description: 'Learn numbers with production and an example',
      thumbnailPath: AssetsPath.getNumberImage(Numbers.numbers),
      route: MaterialPageRoute(builder: (context) => const AtoZ()),
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Module(
      name: 'Animals',
      description: 'Learn about animals and their sounds',
      thumbnailPath: AssetsPath.getAnimalImage(Animals.animals),
      route: MaterialPageRoute(builder: (context) => AnimalsPage()),
      backgroundColor: const Color.fromARGB(194, 157, 82, 222),
    ),
    Module(
      name: 'Birds',
      description: 'Look out for Birds with their sounds',
      thumbnailPath: AssetsPath.getBirdImage(Birds.birds),
      route: MaterialPageRoute(builder: (context) => BirdsPage()),
      backgroundColor: const Color.fromARGB(193, 76, 207, 222),
    ),
    Module(
        name: "Colors",
        description: "Explore and Learn about the colors",
        thumbnailPath: AssetsPath.getColoursImage(ColorImages.colorsCover),
        route: MaterialPageRoute(builder: (context) => const ColoursPage()),
        backgroundColor: const Color.fromARGB(193, 21, 234, 28)),
    Module(
      name: 'Body Parts',
      description: 'Know about body parts and their pronunciation.',
      thumbnailPath: AssetsPath.getBodyImage(Body.body),
      route: MaterialPageRoute(builder: (context) => const PartsPage()),
      backgroundColor: const Color.fromARGB(157, 251, 0, 0),
    ),
    Module(
      name: 'Shapes',
      description: 'Learn about shapes',
      thumbnailPath: 'assets/images/shape.gif',
      route: MaterialPageRoute(builder: (context) => const ShapesPage()),
      backgroundColor: const Color.fromARGB(193, 21, 234, 28),
    ),
    Module(
      name: 'Solar System',
      description: 'Learn about the solar system',
      thumbnailPath: "assets/images/solar/solar.gif",
      route: MaterialPageRoute(builder: (context) => PlanetsPage()),
      backgroundColor: const Color.fromARGB(193, 226, 221, 70),
    ),
  ];

  static const List<String> candidates = [
    "Eye",
    "Lips",
    "Ankle",
    "Arm",
    "Back",
    "Belly",
    "Cheek",
    "Chest",
    "Chin",
    "Ear",
    "Elbow",
    "Foot",
    "Fingers",
    "Hair",
    "Hips",
    "Knee",
    "Leg",
    "Nail",
    "Neck",
    "Nose",
    "Palm",
    "Shoulder",
    "Stomach",
    "Teeth",
    "Thigh",
    "Thumb",
    "Toe",
    "Tongue",
    "Waist",
    "Wrist"
  ];
  static List<Questions> ques = [
    Questions(
      question: "How many Orange Cars are there?",
      options: ["5", "6", "1", "2"],
      image: "assets/quiz/q1.jpg",
      answer: 3, // Index of the correct option, in this case, "Paris"
    ),
    Questions(
      question: "Count the Pokemons.",
      image: "assets/quiz/q2.jpg",

      options: ["11", "9", "10", "8"],
      answer: 2, // Index of the correct option, in this case, "Au"
    ),
    Questions(
      question: "1,2,_,4,5",
      options: ["5", "3", "6", "4"],
      answer: 1, // Index of the correct option, in this case, "105"
    ),
    Questions(
      question: "10,20_,40,50",
      options: ["60", "20", "30", "70"],
      answer: 2, // Index of the correct option, in this case, "Dart"
    ),
    Questions(
      question: "Count Yellow Bears.",
      image: "assets/quiz/q5.jpg",
      options: ["2", "3", "4", "5"],
      answer: 1, // Index of the correct option, in this case, "1492"
    ),
    Questions(
      question: "Count the Number of Balls",
      image: "assets/quiz/q6.jpg",
      options: ["5", "6", "4", "7"],
      answer: 0, // Index of the correct option, in this case, "1492"
    ),
    Questions(
      question: "Count Hearts",
      image: "assets/quiz/q7.jpg",
      options: ["10", "6", "9", "7"],
      answer: 3, // Index of the correct option, in this case, "1492"
    ),
    Questions(
      question: "Count Buckets",
      image: "assets/quiz/q9.jpg",
      options: ["1", "2", "3", "4"],
      answer: 0, // Index of the correct option, in this case, "1492"
    ),
    Questions(
      question: "Count the pencils",
      image: "assets/quiz/q10.jpg",
      options: ["10", "12", "13", "11"],
      answer: 2, // Index of the correct option, in this case, "1492"
    ),
  ];
  static List<ItemData> numberItems = [
    ItemData(
      iconAsset: AssetsPath.getNumberImage(Numbers.zero),
      title: '0',
      description: 'zero',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: AssetsPath.getNumberImage(Numbers.one),
      title: '1',
      description: 'one',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: AssetsPath.getNumberImage(Numbers.two),
      title: '2',
      description: 'two',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: AssetsPath.getNumberImage(Numbers.three),
      title: '3',
      description: 'three',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: AssetsPath.getNumberImage(Numbers.four),
      title: '4',
      description: 'four',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: AssetsPath.getNumberImage(Numbers.five),
      title: '5',
      description: 'five',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: AssetsPath.getNumberImage(Numbers.six),
      title: '6',
      description: 'six',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: AssetsPath.getNumberImage(Numbers.seven),
      title: '7',
      description: 'seven',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: AssetsPath.getNumberImage(Numbers.eight),
      title: '8',
      description: 'eight',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: AssetsPath.getNumberImage(Numbers.nine),
      title: '9',
      description: 'nine',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
  ];
  static List<ItemData> alphabetItems = [
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.apple),
      title: 'A',
      description: 'Apple',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.ball),
      title: 'B',
      description: 'Ball',
      backgroundColor: const Color.fromARGB(115, 215, 118, 118),
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.cat),
      title: 'C',
      description: 'Cat',
      backgroundColor: const Color.fromARGB(194, 130, 243, 69),
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.dog),
      title: 'D',
      description: 'Dog',
      backgroundColor: const Color.fromARGB(115, 215, 199, 118),
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.elephant),
      title: 'E',
      description: 'Elephant',
      backgroundColor: const Color.fromARGB(115, 118, 215, 173),
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.fish),
      title: 'F',
      description: 'Fish',
      backgroundColor: const Color.fromARGB(115, 150, 118, 215),
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.grapes),
      title: 'G',
      backgroundColor: const Color.fromARGB(115, 215, 118, 175),
      description: 'Grapes',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.horse),
      title: 'H',
      backgroundColor: const Color.fromARGB(115, 157, 215, 118),
      description: 'Horse',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.icecream),
      title: 'I',
      backgroundColor: const Color.fromARGB(221, 176, 102, 220),
      description: 'Ice-Cream',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.joker),
      title: 'J',
      description: 'Joker',
      backgroundColor: const Color.fromARGB(208, 112, 181, 206),
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.king),
      title: 'K',
      backgroundColor: const Color.fromARGB(115, 171, 215, 118),
      description: 'King',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.lion),
      title: 'L',
      description: 'Lion',
      backgroundColor: const Color.fromARGB(236, 235, 229, 53),
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.money),
      title: 'M',
      description: 'Money',
      backgroundColor: const Color.fromARGB(115, 118, 189, 215),
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.nest),
      title: 'N',
      description: 'Nest',
      backgroundColor: const Color.fromARGB(115, 118, 215, 121),
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.orange),
      title: 'O',
      description: 'Orange',
      backgroundColor: const Color.fromARGB(115, 215, 189, 118),
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.parrot),
      title: 'P',
      backgroundColor: const Color.fromARGB(115, 120, 118, 215),
      description: 'Parrot',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.queen),
      title: 'Q',
      backgroundColor: const Color.fromARGB(115, 215, 118, 118),
      description: 'Queen',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.rabbit),
      title: 'R',
      description: 'Rabbit',
      backgroundColor: const Color.fromARGB(174, 134, 218, 191),
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.shiva),
      title: 'S',
      backgroundColor: const Color.fromARGB(170, 156, 216, 145),
      description: 'Shiva',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.table),
      title: 'T',
      backgroundColor: const Color.fromARGB(180, 138, 64, 228),
      description: 'Table',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.umbrella),
      title: 'U',
      backgroundColor: const Color.fromARGB(189, 212, 127, 220),
      description: 'Umbrella',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.van),
      title: 'V',
      backgroundColor: const Color.fromARGB(115, 215, 118, 118),
      description: 'Van',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.window),
      title: 'W',
      backgroundColor: const Color.fromARGB(246, 255, 194, 25),
      description: 'Window',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.xerox),
      title: 'X',
      backgroundColor: const Color.fromARGB(115, 0, 236, 71),
      description: 'Xerox',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.yellow),
      title: 'Y',
      backgroundColor: const Color.fromARGB(115, 9, 255, 230),
      description: 'Yellow',
    ),
    ItemData(
      iconAsset: AssetsPath.getAlphabetImage(Alphabets.zero),
      title: 'Z',
      backgroundColor: const Color.fromARGB(155, 81, 0, 255),
      description: 'Zero',
    ),
  ];

  static List<Animal> animals = [
    Animal(
      name: 'Cat',
      svgAsset: AssetsPath.getAnimalImage(Animals.cat),
      soundAsset: AssetsPath.getAnimalSound(Animals.catSound),
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Animal(
      name: 'Deer',
      svgAsset: AssetsPath.getAnimalImage(Animals.deer),
      soundAsset: AssetsPath.getAnimalSound(Animals.deerSound),
      backgroundColor: const Color.fromARGB(194, 157, 82, 222),
    ),
    Animal(
      name: 'Bear',
      svgAsset: AssetsPath.getAnimalImage(Animals.bear),
      soundAsset: AssetsPath.getAnimalSound(Animals.bearSound),
      backgroundColor: const Color.fromARGB(193, 76, 207, 222),
    ),
    Animal(
      name: 'Cow',
      svgAsset: AssetsPath.getAnimalImage(Animals.cow),
      soundAsset: AssetsPath.getAnimalSound(Animals.cowSound),
      backgroundColor: const Color.fromARGB(157, 251, 0, 0),
    ),
    Animal(
      name: 'Fox',
      svgAsset: AssetsPath.getAnimalImage(Animals.fox),
      soundAsset: AssetsPath.getAnimalSound(Animals.foxSound),
      backgroundColor: const Color.fromARGB(193, 21, 234, 28),
    ),
    Animal(
      name: 'Giraffe',
      svgAsset: AssetsPath.getAnimalImage(Animals.giraffe),
      soundAsset: AssetsPath.getAnimalSound(Animals.giraffeSound),
      backgroundColor: const Color.fromARGB(193, 226, 221, 70),
    ),
    Animal(
      name: 'Goat',
      svgAsset: AssetsPath.getAnimalImage(Animals.goat),
      soundAsset: AssetsPath.getAnimalSound(Animals.goatSound),
      backgroundColor: const Color.fromARGB(138, 48, 59, 48),
    ),
    Animal(
      name: 'Kangaroo',
      svgAsset: AssetsPath.getAnimalImage(Animals.kangaroo),
      soundAsset: AssetsPath.getAnimalSound(Animals.kangarooSound),
      backgroundColor: const Color.fromARGB(154, 221, 214, 209),
    ),
    Animal(
      name: 'Monkey',
      svgAsset: AssetsPath.getAnimalImage(Animals.monkey),
      soundAsset: AssetsPath.getAnimalSound(Animals.monkeySound),
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Animal(
      name: 'Pig',
      svgAsset: AssetsPath.getAnimalImage(Animals.pig),
      soundAsset: AssetsPath.getAnimalSound(Animals.pigSound),
      backgroundColor: const Color.fromARGB(151, 40, 137, 248),
    ),
    Animal(
      name: 'Sheep',
      svgAsset: AssetsPath.getAnimalImage(Animals.sheep),
      soundAsset: AssetsPath.getAnimalSound(Animals.sheepSound),
      backgroundColor: const Color.fromARGB(193, 240, 241, 170),
    ),
    Animal(
      name: 'Snake',
      svgAsset: AssetsPath.getAnimalImage(Animals.snake),
      soundAsset: AssetsPath.getAnimalSound(Animals.snakeSound),
      backgroundColor: const Color.fromARGB(193, 125, 176, 127),
    ),
    Animal(
      name: 'Squirrel',
      svgAsset: AssetsPath.getAnimalImage(Animals.squirrel),
      soundAsset: AssetsPath.getAnimalSound(Animals.squirrelSound),
      backgroundColor: const Color.fromARGB(139, 175, 140, 76),
    ),
    Animal(
      name: 'Tiger',
      svgAsset: AssetsPath.getAnimalImage(Animals.tiger),
      soundAsset: AssetsPath.getAnimalSound(Animals.tigerSound),
      backgroundColor: const Color.fromARGB(157, 251, 151, 0),
    ),
    Animal(
      name: 'Zebra',
      svgAsset: AssetsPath.getAnimalImage(Animals.zebra),
      soundAsset: AssetsPath.getAnimalSound(Animals.zebraSound),
      backgroundColor: const Color.fromARGB(193, 187, 74, 178),
    ),
    Animal(
      name: 'Dog',
      svgAsset: AssetsPath.getAnimalImage(Animals.dog),
      soundAsset: AssetsPath.getAnimalSound(Animals.dogSound),
      backgroundColor: const Color.fromARGB(193, 33, 149, 243),
    ),
    Animal(
      name: 'Elephant',
      svgAsset: AssetsPath.getAnimalImage(Animals.elephant),
      soundAsset: AssetsPath.getAnimalSound(Animals.elephantSound),
      backgroundColor: const Color.fromARGB(193, 182, 221, 252),
    ),
    Animal(
      name: 'Horse',
      svgAsset: AssetsPath.getAnimalImage(Animals.horse),
      soundAsset: AssetsPath.getAnimalSound(Animals.horseSound),
      backgroundColor: const Color.fromARGB(98, 243, 201, 33),
    ),
    Animal(
      name: 'Lion',
      svgAsset: AssetsPath.getAnimalImage(Animals.lion),
      soundAsset: AssetsPath.getAnimalSound(Animals.lionSound),
      backgroundColor: const Color.fromARGB(193, 43, 197, 35),
    ),
    Animal(
      name: 'Rabbit',
      svgAsset: AssetsPath.getAnimalImage(Animals.rabbit),
      soundAsset: AssetsPath.getAnimalSound(Animals.rabbitSound),
      backgroundColor: const Color.fromARGB(156, 243, 33, 236),
    ),
  ];

  static List<Bird> birds = [
    Bird(
      name: 'Sparrow',
      svgAsset: AssetsPath.getBirdImage(Birds.sparrow),
      soundAsset: AssetsPath.getBirdSound(Birds.sparrowSound),
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Bird(
      name: 'Robin',
      svgAsset: AssetsPath.getBirdImage(Birds.robin),
      soundAsset: AssetsPath.getBirdSound(Birds.robinSound),
      backgroundColor: const Color.fromARGB(194, 157, 82, 222),
    ),
    Bird(
      name: 'Crow',
      svgAsset: AssetsPath.getBirdImage(Birds.crow),
      soundAsset: AssetsPath.getBirdSound(Birds.crowSound),
      backgroundColor: const Color.fromARGB(193, 76, 207, 222),
    ),
    Bird(
      name: 'Seagull',
      svgAsset: AssetsPath.getBirdImage(Birds.seagull),
      soundAsset: AssetsPath.getBirdSound(Birds.seagullSound),
      backgroundColor: const Color.fromARGB(193, 21, 234, 28),
    ),
    Bird(
      name: 'Duck',
      svgAsset: AssetsPath.getBirdImage(Birds.duck),
      soundAsset: AssetsPath.getBirdSound(Birds.duckSound),
      backgroundColor: const Color.fromARGB(193, 226, 221, 70),
    ),
    Bird(
      name: 'Hen',
      svgAsset: AssetsPath.getBirdImage(Birds.hen),
      soundAsset: AssetsPath.getBirdSound(Birds.henSound),
      backgroundColor: const Color.fromARGB(138, 48, 59, 48),
    ),
    Bird(
      name: 'Eagle',
      svgAsset: AssetsPath.getBirdImage(Birds.eagle),
      soundAsset: AssetsPath.getBirdSound(Birds.eagleSound),
      backgroundColor: const Color.fromARGB(154, 221, 214, 209),
    ),
    Bird(
      name: 'Owl',
      svgAsset: AssetsPath.getBirdImage(Birds.owl),
      soundAsset: AssetsPath.getBirdSound(Birds.owlSound),
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Bird(
      name: 'Hummingbird',
      svgAsset: AssetsPath.getBirdImage(Birds.hummingbird),
      soundAsset: AssetsPath.getBirdSound(Birds.hummingbirdSound),
      backgroundColor: const Color.fromARGB(151, 40, 137, 248),
    ),
    Bird(
      name: 'Parrot',
      svgAsset: AssetsPath.getBirdImage(Birds.parrot),
      soundAsset: AssetsPath.getBirdSound(Birds.parrotSound),
      backgroundColor: const Color.fromARGB(193, 240, 241, 170),
    ),
    Bird(
      name: 'Swan',
      svgAsset: AssetsPath.getBirdImage(Birds.swan),
      soundAsset: AssetsPath.getBirdSound(Birds.swanSound),
      backgroundColor: const Color.fromARGB(193, 125, 176, 127),
    ),
    Bird(
      name: 'Goose',
      svgAsset: AssetsPath.getBirdImage(Birds.goose),
      soundAsset: AssetsPath.getBirdSound(Birds.gooseSound),
      backgroundColor: const Color.fromARGB(139, 175, 140, 76),
    ),
    Bird(
      name: 'Woodpecker',
      svgAsset: AssetsPath.getBirdImage(Birds.woodpecker),
      soundAsset: AssetsPath.getBirdSound(Birds.woodpeckerSound),
      backgroundColor: const Color.fromARGB(157, 251, 151, 0),
    ),
    Bird(
      name: 'Kingfisher',
      svgAsset: AssetsPath.getBirdImage(Birds.kingfisher),
      soundAsset: AssetsPath.getBirdSound(Birds.kingfisherSound),
      backgroundColor: const Color.fromARGB(193, 187, 74, 178),
    ),
    Bird(
      name: 'Ostrich',
      svgAsset: AssetsPath.getBirdImage(Birds.ostrich),
      soundAsset: AssetsPath.getBirdSound(Birds.ostrichSound),
      backgroundColor: const Color.fromARGB(193, 182, 221, 252),
    ),
    Bird(
      name: 'Vulture',
      svgAsset: AssetsPath.getBirdImage(Birds.vulture),
      soundAsset: AssetsPath.getBirdSound(Birds.vultureSound),
      backgroundColor: const Color.fromARGB(98, 243, 201, 33),
    ),
    Bird(
      name: 'Maina',
      svgAsset: AssetsPath.getBirdImage(Birds.maina),
      soundAsset: AssetsPath.getBirdSound(Birds.mainaSound),
      backgroundColor: const Color.fromARGB(255, 73, 179, 63),
    ),
    Bird(
      name: 'Bulbul',
      svgAsset: AssetsPath.getBirdImage(Birds.bulbul),
      soundAsset: AssetsPath.getBirdSound(Birds.bulbulSound),
      backgroundColor: const Color.fromARGB(156, 128, 222, 243),
    ),
    Bird(
      name: 'Koel',
      svgAsset: AssetsPath.getBirdImage(Birds.koel),
      soundAsset: AssetsPath.getBirdSound(Birds.koelSound),
      backgroundColor: const Color.fromARGB(232, 141, 255, 93),
    ),
    Bird(
      name: 'Baya',
      svgAsset: AssetsPath.getBirdImage(Birds.baya),
      soundAsset: AssetsPath.getBirdSound(Birds.bayaSound),
      backgroundColor: const Color.fromARGB(193, 106, 190, 101),
    ),
    Bird(
      name: 'Bagula',
      svgAsset: AssetsPath.getBirdImage(Birds.bagula),
      soundAsset: AssetsPath.getBirdSound(Birds.bagulaSound),
      backgroundColor: const Color.fromARGB(156, 248, 248, 248),
    ),
  ];

  static List<Season> seasons = [
    Season(
      name: 'Spring',
      description:
          'Spring is the season of new beginnings. Fresh buds bloom and animals awaken.',
      imageAsset: 'assets/seasons/spring.svg',
      backgroundColor: Colors.lightGreen,
    ),
    Season(
      name: 'Summer',
      description:
          'Summer is the hottest of the four temperate seasons, falling after spring and before autumn.',
      imageAsset: 'assets/seasons/summer.svg',
      backgroundColor: Colors.yellowAccent.shade400,
    ),
    Season(
      name: 'Autumn',
      description:
          'Autumn is the season of the year between summer and winter, during which temperatures gradually decrease.',
      imageAsset: 'assets/seasons/autumn.svg',
      backgroundColor: Colors.orangeAccent,
    ),
    Season(
      name: 'Winter',
      description:
          'Winter is the coldest season of the year in polar and temperate zones.',
      imageAsset: 'assets/seasons/winter.svg',
      backgroundColor: Colors.lightBlue,
    ),
  ];

  static final List<Occupation> occupations = [
    Occupation(
      name: "Doctor",
      description:
          "A doctor works in a hospital and helps people get better when they are sick.",
      svgAsset: "assets/occupations/doctor.svg",
      backgroundColor: Colors.lightBlue.shade200,
    ),
    Occupation(
      name: "Teacher",
      description:
          "A teacher works in a school and teaches children how to read and write.",
      svgAsset: "assets/occupations/teacher.svg",
      backgroundColor: Colors.yellow.shade100,
    ),
    Occupation(
      name: "Police Officer",
      description:
          "A police officer works in the police station and catches thieves.",
      svgAsset: "assets/occupations/police.svg",
      backgroundColor: Colors.green.shade200,
    ),
    Occupation(
      name: "Engineer",
      description:
          "An engineer works in many places and build machines, buildings and bridges.",
      svgAsset: "assets/occupations/engineer.svg",
      backgroundColor: Colors.red.shade200,
    ),
    Occupation(
      name: "Pilot",
      description:
          "A pilot flies airplanes to take people to different places in the world.",
      svgAsset: "assets/occupations/pilot.svg",
      backgroundColor: Colors.white,
    ),
    Occupation(
      name: "Artist",
      description:
          "An artist works in a studio and makes beautiful pictures and sculptures.",
      svgAsset: "assets/occupations/artist.svg",
      backgroundColor: Colors.grey.shade300,
    ),
    Occupation(
      name: "Author",
      description:
          "An author works at home or in an office and writes books and stories for people to read.",
      svgAsset: "assets/occupations/author.svg",
      backgroundColor: Colors.grey.shade300,
    ),
    Occupation(
      name: "Photographer",
      description:
          "A photographer works in different places and takes pictures of people, places, and things.",
      svgAsset: "assets/occupations/photographer.svg",
      backgroundColor: Colors.lightBlue.shade100,
    ),
    Occupation(
      name: "Vet",
      description:
          "A veterinarian works in an animal hospital and helps pets and other animals when they are sick.",
      svgAsset: "assets/occupations/vet.svg",
      backgroundColor: Colors.cyan.shade200,
    ),
    Occupation(
      name: "Farmer",
      description:
          "A farmer works on a farm and grows vegetables and fruits that we eat.",
      svgAsset: "assets/occupations/farmer.svg",
      backgroundColor: Colors.yellow.shade700,
    ),
    Occupation(
      name: "Carpenter",
      description:
          "A carpenter works in workshops and makes furniture for our houses.",
      svgAsset: "assets/occupations/carpenter.svg",
      backgroundColor: Colors.orange.shade100,
    ),
    Occupation(
      name: "Electrician",
      description:
          "An electrician works in homes and fixes electrical wires and lights.",
      svgAsset: "assets/occupations/electrician.svg",
      backgroundColor: Colors.lightBlue.shade200,
    ),
    Occupation(
      name: "Barber",
      description: "A barber works in a barbershop and cuts hair.",
      svgAsset: "assets/occupations/barber.svg",
      backgroundColor: Colors.lightBlue.shade200,
    ),
    Occupation(
      name: "Dentist",
      description:
          "A dentist works in a dental hospital and helps keep our teeth clean and healthy.",
      svgAsset: "assets/occupations/dentist.svg",
      backgroundColor: Colors.white,
    ),
    Occupation(
      name: "Lawyer",
      description:
          "A lawyer works in an office and helps people understand and follow the law.",
      svgAsset: "assets/occupations/lawyer.svg",
      backgroundColor: Colors.brown.shade300,
    ),
  ];
  static List<Fruit> Fruits = [
    Fruit(
      name: 'Apple',
      svgAsset: 'assets/fruitsVeges/apple.svg',
      backgroundColor: Colors.white,
      isfruit: true,
    ),
    Fruit(
      name: 'Banana',
      svgAsset: 'assets/fruitsVeges/banana.svg',
      backgroundColor: Colors.white,
      isfruit: true,
    ),
    Fruit(
      name: 'Carrot',
      svgAsset: 'assets/fruitsVeges/carrot.svg',
      backgroundColor: Colors.white,
      isfruit: false,
    ),
    Fruit(
      name: 'Red Chilli',
      svgAsset: 'assets/fruitsVeges/chilli.svg',
      backgroundColor: Colors.white,
      isfruit: false,
    ),
    Fruit(
      name: 'Eggplant',
      svgAsset: 'assets/fruitsVeges/eggplant.svg',
      backgroundColor: Colors.white,
      isfruit: false,
    ),
    Fruit(
      name: 'Ginger',
      svgAsset: 'assets/fruitsVeges/ginger.svg',
      backgroundColor: Colors.white,
      isfruit: false,
    ),
    Fruit(
      name: 'Grapes',
      svgAsset: 'assets/fruitsVeges/grapes.svg',
      backgroundColor: Colors.white,
      isfruit: true,
    ),
    Fruit(
      name: 'Kiwi',
      svgAsset: 'assets/fruitsVeges/kiwi.svg',
      backgroundColor: Colors.white,
      isfruit: true,
    ),
    Fruit(
      name: 'Okra',
      svgAsset: 'assets/fruitsVeges/okra.svg',
      backgroundColor: Colors.white,
      isfruit: false,
    ),
    Fruit(
      name: 'Onion',
      svgAsset: 'assets/fruitsVeges/onion.svg',
      backgroundColor: Colors.white,
      isfruit: false,
    ),
    Fruit(
      name: 'Orange',
      svgAsset: 'assets/fruitsVeges/orange.svg',
      backgroundColor: Colors.white,
      isfruit: true,
    ),
    Fruit(
      name: 'Pineapple',
      svgAsset: 'assets/fruitsVeges/pineapple.svg',
      backgroundColor: Colors.white,
      isfruit: true,
    ),
    Fruit(
      name: 'potato',
      svgAsset: 'assets/fruitsVeges/potato.svg',
      backgroundColor: Colors.white,
      isfruit: false,
    ),
    Fruit(
      name: 'Strawberry',
      svgAsset: 'assets/fruitsVeges/strawberry.svg',
      backgroundColor: Colors.white,
      isfruit: true,
    ),
    Fruit(
      name: 'tomato',
      svgAsset: 'assets/fruitsVeges/tomato.svg',
      backgroundColor: Colors.white,
      isfruit: false,
    ),
    Fruit(
      name: 'Watermelon',
      svgAsset: 'assets/fruitsVeges/watermelon.svg',
      backgroundColor: Colors.white,
      isfruit: true,
    ),
  ];

  static const String underConstruction =
      'Page Under Construction.\nIt will not take much time.';

  static const String a_z = 'A-Z';
  static const String numbers = 'Numbers';
  static const String bird = 'Birds';
  static const String animal = 'Animals';
  static const String parts = 'Body Parts';
  static const String shape = 'Shapes';
  static const String solar = 'Solar System';
  static const String color = 'Colours';
  static const String flower = 'Flowers';
  static const String fruit = 'Fruits & Vegetables';
  static const String occupation = 'Occupations';
  static const String season = 'Seasons Serenade';
  static const String description =
      'Interactive app to let your kids learn various things like\n\n - A - Z alphabets.\n - Animals and their sounds.\n - Birds and their sounds.\n - Various shapes.\n - Body parts.\n - Solar system.\n';
}
