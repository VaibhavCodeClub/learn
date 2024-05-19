import 'dart:ui';

import 'package:learn/utils/assets_path.dart';

import '../pages/modules/animals.dart';
import '../pages/modules/atoz.dart';
import '../pages/modules/birds.dart';

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
      soundAsset:AssetsPath.getAnimalSound(Animals.goatSound),
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
      soundAsset:AssetsPath.getAnimalSound(Animals.zebraSound),
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
      soundAsset:AssetsPath.getAnimalSound(Animals.horseSound),
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

  static const String underConstruction =
      'Page Under Construction.\nIt will not take much time.';

  static const String a_z = 'A-Z';
  static const String bird = 'Birds';
  static const String animal = 'Animals';
  static const String parts = 'Body Parts';
  static const String shape = 'Shapes';
  static const String solar = 'Solar System';
  static const String flowers = 'Flowers';
  static const String description =
      'Interactive app to let your kids learn various things like\n\n - A - Z alphabets.\n - Animals and their sounds.\n - Birds and their sounds.\n - Various shapes.\n - Body parts.\n - Solar system.\n';
}
