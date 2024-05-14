import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learn/pages/fruits.dart';

import '../pages/animals.dart';
import '../pages/atoz.dart';
import '../pages/birds.dart';

class AppConstants {
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

  static List<ItemData> items = [
    ItemData(
      iconAsset: 'assets/images/apple.svg',
      title: 'A',
      description: 'Apple',
      backgroundColor: const Color.fromARGB(115, 171, 171, 171),
    ),
    ItemData(
      iconAsset: 'assets/images/ball.svg',
      title: 'B',
      description: 'Ball',
      backgroundColor: const Color.fromARGB(115, 215, 118, 118),
    ),
    ItemData(
      iconAsset: 'assets/images/cat.svg',
      title: 'C',
      description: 'Cat',
      backgroundColor: const Color.fromARGB(194, 130, 243, 69),
    ),
    ItemData(
      iconAsset: 'assets/images/dog.svg',
      title: 'D',
      description: 'Dog',
      backgroundColor: const Color.fromARGB(115, 215, 199, 118),
    ),
    ItemData(
      iconAsset: 'assets/images/elephant.svg',
      title: 'E',
      description: 'Elephant',
      backgroundColor: const Color.fromARGB(115, 118, 215, 173),
    ),
    ItemData(
      iconAsset: 'assets/images/fish.svg',
      title: 'F',
      description: 'Fish',
      backgroundColor: const Color.fromARGB(115, 150, 118, 215),
    ),
    ItemData(
      iconAsset: 'assets/images/grapes.svg',
      title: 'G',
      backgroundColor: const Color.fromARGB(115, 215, 118, 175),
      description: 'Grapes',
    ),
    ItemData(
      iconAsset: 'assets/images/horse.svg',
      title: 'H',
      backgroundColor: const Color.fromARGB(115, 157, 215, 118),
      description: 'Horse',
    ),
    ItemData(
      iconAsset: 'assets/images/icecream.svg',
      title: 'I',
      backgroundColor: const Color.fromARGB(221, 176, 102, 220),
      description: 'Ice-Cream',
    ),
    ItemData(
      iconAsset: 'assets/images/joker.svg',
      title: 'J',
      description: 'Joker',
      backgroundColor: const Color.fromARGB(208, 112, 181, 206),
    ),
    ItemData(
      iconAsset: 'assets/images/king.svg',
      title: 'K',
      backgroundColor: const Color.fromARGB(115, 171, 215, 118),
      description: 'King',
    ),
    ItemData(
      iconAsset: 'assets/images/lion.svg',
      title: 'L',
      description: 'Lion',
      backgroundColor: const Color.fromARGB(236, 235, 229, 53),
    ),
    ItemData(
      iconAsset: 'assets/images/money.svg',
      title: 'M',
      description: 'Money',
      backgroundColor: const Color.fromARGB(115, 118, 189, 215),
    ),
    ItemData(
      iconAsset: 'assets/images/nest.svg',
      title: 'N',
      description: 'Nest',
      backgroundColor: const Color.fromARGB(115, 118, 215, 121),
    ),
    ItemData(
      iconAsset: 'assets/images/orange.svg',
      title: 'O',
      description: 'Orange',
      backgroundColor: const Color.fromARGB(115, 215, 189, 118),
    ),
    ItemData(
      iconAsset: 'assets/images/parrot.svg',
      title: 'P',
      backgroundColor: const Color.fromARGB(115, 120, 118, 215),
      description: 'Parrot',
    ),
    ItemData(
      iconAsset: 'assets/images/queen.svg',
      title: 'Q',
      backgroundColor: const Color.fromARGB(115, 215, 118, 118),
      description: 'Queen',
    ),
    ItemData(
      iconAsset: 'assets/images/rabbit.svg',
      title: 'R',
      description: 'Rabbit',
      backgroundColor: const Color.fromARGB(174, 134, 218, 191),
    ),
    ItemData(
      iconAsset: 'assets/images/shiva.svg',
      title: 'S',
      backgroundColor: const Color.fromARGB(170, 156, 216, 145),
      description: 'Shiva',
    ),
    ItemData(
      iconAsset: 'assets/images/table.svg',
      title: 'T',
      backgroundColor: const Color.fromARGB(180, 138, 64, 228),
      description: 'Table',
    ),
    ItemData(
      iconAsset: 'assets/images/umbrella.svg',
      title: 'U',
      backgroundColor: const Color.fromARGB(189, 212, 127, 220),
      description: 'Umbrella',
    ),
    ItemData(
      iconAsset: 'assets/images/van.svg',
      title: 'V',
      backgroundColor: const Color.fromARGB(115, 215, 118, 118),
      description: 'Van',
    ),
    ItemData(
      iconAsset: 'assets/images/window.svg',
      title: 'W',
      backgroundColor: const Color.fromARGB(246, 255, 194, 25),
      description: 'Window',
    ),
    ItemData(
      iconAsset: 'assets/images/xerox.svg',
      title: 'X',
      backgroundColor: const Color.fromARGB(115, 0, 236, 71),
      description: 'Xerox',
    ),
    ItemData(
      iconAsset: 'assets/images/yellow.svg',
      title: 'Y',
      backgroundColor: const Color.fromARGB(115, 9, 255, 230),
      description: 'Yellow',
    ),
    ItemData(
      iconAsset: 'assets/images/zero.svg',
      title: 'Z',
      backgroundColor: const Color.fromARGB(155, 81, 0, 255),
      description: 'Zero',
    ),
  ];

  static List<Animal> animals = [
    Animal(
      name: 'Cat',
      svgAsset: 'assets/images/cat.svg',
      soundAsset: 'assets/sounds/cat_sound.wav',
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Animal(
      name: 'Deer',
      svgAsset: 'assets/images/deer.svg',
      soundAsset: 'assets/sounds/deer_sound.mp3',
      backgroundColor: const Color.fromARGB(194, 157, 82, 222),
    ),
    Animal(
      name: 'Bear',
      svgAsset: 'assets/images/bear.svg',
      soundAsset: 'assets/sounds/bear_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 207, 222),
    ),
    Animal(
      name: 'Cow',
      svgAsset: 'assets/images/cow.svg',
      soundAsset: 'assets/sounds/cow_sound.mp3',
      backgroundColor: const Color.fromARGB(157, 251, 0, 0),
    ),
    Animal(
      name: 'Fox',
      svgAsset: 'assets/images/fox.svg',
      soundAsset: 'assets/sounds/fox_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 21, 234, 28),
    ),
    Animal(
      name: 'Giraffe',
      svgAsset: 'assets/images/giraffe.svg',
      soundAsset: 'assets/sounds/giraffe_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 226, 221, 70),
    ),
    Animal(
      name: 'Goat',
      svgAsset: 'assets/images/goat.svg',
      soundAsset: 'assets/sounds/goat_sound.mp3',
      backgroundColor: const Color.fromARGB(138, 48, 59, 48),
    ),
    Animal(
      name: 'Kangaroo',
      svgAsset: 'assets/images/kangaroo.svg',
      soundAsset: 'assets/sounds/kangaroo_sound.mp3',
      backgroundColor: const Color.fromARGB(154, 221, 214, 209),
    ),
    Animal(
      name: 'Monkey',
      svgAsset: 'assets/images/monkey.svg',
      soundAsset: 'assets/sounds/monkey_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Animal(
      name: 'Pig',
      svgAsset: 'assets/images/pig.svg',
      soundAsset: 'assets/sounds/pig_sound.mp3',
      backgroundColor: const Color.fromARGB(151, 40, 137, 248),
    ),
    Animal(
      name: 'Sheep',
      svgAsset: 'assets/images/sheep.svg',
      soundAsset: 'assets/sounds/sheep_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 240, 241, 170),
    ),
    Animal(
      name: 'Snake',
      svgAsset: 'assets/images/snake.svg',
      soundAsset: 'assets/sounds/snake_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 125, 176, 127),
    ),
    Animal(
      name: 'Squirrel',
      svgAsset: 'assets/images/squirrel.svg',
      soundAsset: 'assets/sounds/squirrel_sound.mp3',
      backgroundColor: const Color.fromARGB(139, 175, 140, 76),
    ),
    Animal(
      name: 'Tiger',
      svgAsset: 'assets/images/tiger.svg',
      soundAsset: 'assets/sounds/tiger_sound.mp3',
      backgroundColor: const Color.fromARGB(157, 251, 151, 0),
    ),
    Animal(
      name: 'Zebra',
      svgAsset: 'assets/images/zebra.svg',
      soundAsset: 'assets/sounds/zebra_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 187, 74, 178),
    ),
    Animal(
      name: 'Dog',
      svgAsset: 'assets/images/dog.svg',
      soundAsset: 'assets/sounds/dog_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 33, 149, 243),
    ),
    Animal(
      name: 'Elephant',
      svgAsset: 'assets/images/elephant.svg',
      soundAsset: 'assets/sounds/elephant_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 182, 221, 252),
    ),
    Animal(
      name: 'Horse',
      svgAsset: 'assets/images/horse.svg',
      soundAsset: 'assets/sounds/horse_sound.mp3',
      backgroundColor: const Color.fromARGB(98, 243, 201, 33),
    ),
    Animal(
      name: 'Lion',
      svgAsset: 'assets/images/lion.svg',
      soundAsset: 'assets/sounds/lion_sound.mp3',
      backgroundColor: const Color.fromARGB(193, 43, 197, 35),
    ),
    Animal(
      name: 'Rabbit',
      svgAsset: 'assets/images/rabbit.svg',
      soundAsset: 'assets/sounds/rabbit_sound.mp3',
      backgroundColor: const Color.fromARGB(156, 243, 33, 236),
    ),
  ];

  static List<Bird> birds = [
    Bird(
      name: 'Sparrow',
      svgAsset: 'assets/birds/Sparrow.svg',
      soundAsset: 'assets/birds/Sparrow.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Bird(
      name: 'Robin',
      svgAsset: 'assets/birds/Robin.svg',
      soundAsset: 'assets/birds/Robin.mp3',
      backgroundColor: const Color.fromARGB(194, 157, 82, 222),
    ),
    Bird(
      name: 'Crow',
      svgAsset: 'assets/birds/Crow.svg',
      soundAsset: 'assets/birds/Crow.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 207, 222),
    ),
    Bird(
      name: 'Seagull',
      svgAsset: 'assets/birds/Seagull.svg',
      soundAsset: 'assets/birds/Seagull.mp3',
      backgroundColor: const Color.fromARGB(193, 21, 234, 28),
    ),
    Bird(
      name: 'Duck',
      svgAsset: 'assets/birds/Duck.svg',
      soundAsset: 'assets/birds/Duck.mp3',
      backgroundColor: const Color.fromARGB(193, 226, 221, 70),
    ),
    Bird(
      name: 'Hen',
      svgAsset: 'assets/birds/Hen.svg',
      soundAsset: 'assets/birds/Hen.mp3',
      backgroundColor: const Color.fromARGB(138, 48, 59, 48),
    ),
    Bird(
      name: 'Eagle',
      svgAsset: 'assets/birds/Eagle.svg',
      soundAsset: 'assets/birds/Eagle.mp3',
      backgroundColor: const Color.fromARGB(154, 221, 214, 209),
    ),
    Bird(
      name: 'Owl',
      svgAsset: 'assets/birds/Owl.svg',
      soundAsset: 'assets/birds/Owl.mp3',
      backgroundColor: const Color.fromARGB(193, 76, 175, 79),
    ),
    Bird(
      name: 'Hummingbird',
      svgAsset: 'assets/birds/Hummingbird.svg',
      soundAsset: 'assets/birds/Hummingbird.mp3',
      backgroundColor: const Color.fromARGB(151, 40, 137, 248),
    ),
    Bird(
      name: 'Parrot',
      svgAsset: 'assets/birds/Parrot.svg',
      soundAsset: 'assets/birds/Parrot.mp3',
      backgroundColor: const Color.fromARGB(193, 240, 241, 170),
    ),
    Bird(
      name: 'Swan',
      svgAsset: 'assets/birds/Swan.svg',
      soundAsset: 'assets/birds/Swan.mp3',
      backgroundColor: const Color.fromARGB(193, 125, 176, 127),
    ),
    Bird(
      name: 'Goose',
      svgAsset: 'assets/birds/Goose.svg',
      soundAsset: 'assets/birds/Goose.mp3',
      backgroundColor: const Color.fromARGB(139, 175, 140, 76),
    ),
    Bird(
      name: 'Woodpecker',
      svgAsset: 'assets/birds/Woodpecker.svg',
      soundAsset: 'assets/birds/Woodpecker.mp3',
      backgroundColor: const Color.fromARGB(157, 251, 151, 0),
    ),
    Bird(
      name: 'Kingfisher',
      svgAsset: 'assets/birds/Kingfisher.svg',
      soundAsset: 'assets/birds/Kingfisher.mp3',
      backgroundColor: const Color.fromARGB(193, 187, 74, 178),
    ),
    Bird(
      name: 'Ostrich',
      svgAsset: 'assets/birds/Ostrich.svg',
      soundAsset: 'assets/birds/Ostrich.mp3',
      backgroundColor: const Color.fromARGB(193, 182, 221, 252),
    ),
    Bird(
      name: 'Vulture',
      svgAsset: 'assets/birds/Vulture.svg',
      soundAsset: 'assets/birds/Vulture.mp3',
      backgroundColor: const Color.fromARGB(98, 243, 201, 33),
    ),
    Bird(
      name: 'Maina',
      svgAsset: 'assets/birds/Maina.svg',
      soundAsset: 'assets/birds/Maina.mp3',
      backgroundColor: const Color.fromARGB(255, 73, 179, 63),
    ),
    Bird(
      name: 'Bulbul',
      svgAsset: 'assets/birds/Bulbul.svg',
      soundAsset: 'assets/birds/Bulbul.mp3',
      backgroundColor: const Color.fromARGB(156, 128, 222, 243),
    ),
    Bird(
      name: 'Koel',
      svgAsset: 'assets/birds/Koel.svg',
      soundAsset: 'assets/birds/Koel.mp3',
      backgroundColor: const Color.fromARGB(232, 141, 255, 93),
    ),
    Bird(
      name: 'Baya',
      svgAsset: 'assets/birds/Baya.svg',
      soundAsset: 'assets/birds/Baya.mp3',
      backgroundColor: const Color.fromARGB(193, 106, 190, 101),
    ),
    Bird(
      name: 'Bagula',
      svgAsset: 'assets/birds/Bagula.svg',
      soundAsset: 'assets/birds/Bagula.mp3',
      backgroundColor: const Color.fromARGB(156, 248, 248, 248),
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
  static const String bird = 'Birds';
  static const String animal = 'Animals';
  static const String parts = 'Body Parts';
  static const String shape = 'Shapes';
  static const String solar = 'Solar System';
  static const String fruit = 'Fruits & Vegetables';
  static const String description =
      'Interactive app to let your kids learn various things like\n\n - A - Z alphabets.\n - Animals and their sounds.\n - Birds and their sounds.\n - Various shapes.\n - Body parts.\n - Solar system.\n';
}
