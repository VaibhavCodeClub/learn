import 'package:flutter/material.dart';
import 'item_tile.dart';

void main() {
  runApp(const AtoZ());
}

class AtoZ extends StatelessWidget {
  const AtoZ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'A-Z',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(9),
          child: GridView.count(
            crossAxisCount: 2,
            children: const [
              ItemTile(
                iconAsset: 'assets/images/apple.svg',
                title: 'A',
                description: 'Apple',
                backgroundColor: Color.fromARGB(115, 171, 171, 171),
              ),
              ItemTile(
                iconAsset: 'assets/images/ball.svg',
                title: 'B',
                description: 'Ball',
                backgroundColor: Color.fromARGB(115, 215, 118, 118),
              ),
              ItemTile(
                iconAsset: 'assets/images/cat.svg',
                title: 'C',
                description: 'Cat',
                backgroundColor: Color.fromARGB(194, 130, 243, 69),
              ),
              ItemTile(
                iconAsset: 'assets/images/dog.svg',
                title: 'D',
                description: 'Dog',
                backgroundColor: Color.fromARGB(115, 215, 199, 118),
              ),
              ItemTile(
                iconAsset: 'assets/images/elephant.svg',
                title: 'E',
                description: 'Elephant',
                backgroundColor: Color.fromARGB(115, 118, 215, 173),
              ),
              ItemTile(
                iconAsset: 'assets/images/fish.svg',
                title: 'F',
                description: 'Fish',
                backgroundColor: Color.fromARGB(115, 150, 118, 215),
              ),
              ItemTile(
                iconAsset: 'assets/images/grapes.svg',
                title: 'G',
                backgroundColor: Color.fromARGB(115, 215, 118, 175),
                description: 'Grapes',
              ),
              ItemTile(
                iconAsset: 'assets/images/horse.svg',
                title: 'H',
                backgroundColor: Color.fromARGB(115, 157, 215, 118),
                description: 'Horse',
              ),
              ItemTile(
                iconAsset: 'assets/images/icecream.svg',
                title: 'I',
                backgroundColor: Color.fromARGB(221, 176, 102, 220),
                description: 'Ice-Cream',
              ),
              ItemTile(
                iconAsset: 'assets/images/joker.svg',
                title: 'J',
                description: 'Joker',
                backgroundColor: Color.fromARGB(208, 112, 181, 206),
              ),
              ItemTile(
                iconAsset: 'assets/images/king.svg',
                title: 'K',
                backgroundColor: Color.fromARGB(115, 171, 215, 118),
                description: 'King',
              ),
              ItemTile(
                iconAsset: 'assets/images/lion.svg',
                title: 'L',
                description: 'Lion',
                backgroundColor: Color.fromARGB(236, 235, 229, 53),
              ),
              ItemTile(
                iconAsset: 'assets/images/money.svg',
                title: 'M',
                description: 'Money',
                backgroundColor: Color.fromARGB(115, 118, 189, 215),
              ),
              ItemTile(
                iconAsset: 'assets/images/nest.svg',
                title: 'N',
                description: 'Nest',
                backgroundColor: Color.fromARGB(115, 118, 215, 121),
              ),
              ItemTile(
                iconAsset: 'assets/images/orange.svg',
                title: 'O',
                description: 'Orange',
                backgroundColor: Color.fromARGB(115, 215, 189, 118),
              ),
              ItemTile(
                iconAsset: 'assets/images/parrot.svg',
                title: 'P',
                backgroundColor: Color.fromARGB(115, 120, 118, 215),
                description: 'Parrot',
              ),
              ItemTile(
                iconAsset: 'assets/images/queen.svg',
                title: 'Q',
                backgroundColor: Color.fromARGB(115, 215, 118, 118),
                description: 'Queen',
              ),
              ItemTile(
                iconAsset: 'assets/images/rabbit.svg',
                title: 'R',
                description: 'Rabbit',
                backgroundColor: Color.fromARGB(174, 134, 218, 191),
              ),
              ItemTile(
                iconAsset: 'assets/images/shiva.svg',
                title: 'S',
                backgroundColor: Color.fromARGB(170, 156, 216, 145),
                description: 'Shiva',
              ),
              ItemTile(
                iconAsset: 'assets/images/table.svg',
                title: 'T',
                backgroundColor: Color.fromARGB(180, 138, 64, 228),
                description: 'Table',
              ),
              ItemTile(
                iconAsset: 'assets/images/umbrella.svg',
                title: 'U',
                backgroundColor: Color.fromARGB(189, 212, 127, 220),
                description: 'Umbrella',
              ),
              ItemTile(
                iconAsset: 'assets/images/van.svg',
                title: 'V',
                backgroundColor: Color.fromARGB(115, 215, 118, 118),
                description: 'Van',
              ),
              ItemTile(
                iconAsset: 'assets/images/window.svg',
                title: 'W',
                backgroundColor: Color.fromARGB(255, 252, 187, 6),
                description: 'Window',
              ),
              ItemTile(
                iconAsset: 'assets/images/xerox.svg',
                title: 'X',
                backgroundColor: Color.fromARGB(115, 0, 236, 71),
                description: 'Xerox',
              ),
              ItemTile(
                iconAsset: 'assets/images/yellow.svg',
                title: 'Y',
                backgroundColor: Color.fromARGB(115, 9, 255, 230),
                description: 'Yellow',
              ),
              ItemTile(
                iconAsset: 'assets/images/zero.svg',
                title: 'Z',
                backgroundColor: Color.fromARGB(155, 81, 0, 255),
                description: 'Zero',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
