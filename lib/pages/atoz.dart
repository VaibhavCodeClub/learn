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
                soundAsset: 'assets/sounds/apple.m4a',
                description: 'Apple',
                alternativeSoundAsset: 'assets/sounds/A.m4a',
                backgroundColor: Color.fromARGB(115, 171, 171, 171),
              ),
              ItemTile(
                iconAsset: 'assets/images/ball.svg',
                title: 'B',
                soundAsset: 'assets/sounds/ball.mp3',
                description: 'Ball',
                backgroundColor: Color.fromARGB(115, 215, 118, 118),
                alternativeSoundAsset: 'assets/sounds/B.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/cat.svg',
                title: 'C',
                soundAsset: 'assets/sounds/kitty.mp3',
                description: 'Cat',
                backgroundColor: Color.fromARGB(194, 130, 243, 69),
                alternativeSoundAsset: 'assets/sounds/C.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/dog.svg',
                title: 'D',
                soundAsset: 'assets/sounds/dogie.mp3',
                description: 'Dog',
                backgroundColor: Color.fromARGB(115, 215, 199, 118),
                alternativeSoundAsset: 'assets/sounds/D.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/elephant.svg',
                title: 'E',
                soundAsset: 'assets/sounds/elephant.mp3',
                description: 'Elephant',
                backgroundColor: Color.fromARGB(115, 118, 215, 173),
                alternativeSoundAsset: 'assets/sounds/E.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/fish.svg',
                title: 'F',
                soundAsset: 'assets/sounds/fishes.mp3',
                description: 'Fish',
                alternativeSoundAsset: 'assets/sounds/F.m4a',
                backgroundColor: Color.fromARGB(115, 150, 118, 215),
              ),
              ItemTile(
                iconAsset: 'assets/images/grapes.svg',
                title: 'G',
                backgroundColor: Color.fromARGB(115, 215, 118, 175),
                soundAsset: 'assets/sounds/grapes.mp3',
                description: 'Grapes',
                alternativeSoundAsset: 'assets/sounds/G.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/horse.svg',
                title: 'H',
                backgroundColor: Color.fromARGB(115, 157, 215, 118),
                soundAsset: 'assets/sounds/horse.mp3',
                description: 'Horse',
                alternativeSoundAsset: 'assets/sounds/H.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/icecream.svg',
                title: 'I',
                backgroundColor: Color.fromARGB(221, 176, 102, 220),
                soundAsset: 'assets/sounds/icecream.mp3',
                description: 'Ice-Cream',
                alternativeSoundAsset: 'assets/sounds/I.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/joker.svg',
                title: 'J',
                soundAsset: 'assets/sounds/joke.mp3',
                description: 'Joker',
                backgroundColor: Color.fromARGB(208, 112, 181, 206),
                alternativeSoundAsset: 'assets/sounds/J.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/king.svg',
                title: 'K',
                backgroundColor: Color.fromARGB(115, 171, 215, 118),
                soundAsset: 'assets/sounds/king.mp3',
                description: 'King',
                alternativeSoundAsset: 'assets/sounds/K.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/lion.svg',
                title: 'L',
                soundAsset: 'assets/sounds/lion.mp3',
                description: 'Lion',
                backgroundColor: Color.fromARGB(236, 235, 229, 53),
                alternativeSoundAsset: 'assets/sounds/L.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/money.svg',
                title: 'M',
                soundAsset: 'assets/sounds/money.mp3',
                description: 'Money',
                backgroundColor: Color.fromARGB(115, 118, 189, 215),
                alternativeSoundAsset: 'assets/sounds/M.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/nest.svg',
                title: 'N',
                soundAsset: 'assets/sounds/nest.mp3',
                description: 'Nest',
                backgroundColor: Color.fromARGB(115, 118, 215, 121),
                alternativeSoundAsset: 'assets/sounds/N.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/orange.svg',
                title: 'O',
                soundAsset: 'assets/sounds/orange.mp3',
                description: 'Orange',
                backgroundColor: Color.fromARGB(115, 215, 189, 118),
                alternativeSoundAsset: 'assets/sounds/O.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/parrot.svg',
                title: 'P',
                backgroundColor: Color.fromARGB(115, 120, 118, 215),
                soundAsset: 'assets/sounds/parot.mp3',
                description: 'Parrot',
                alternativeSoundAsset: 'assets/sounds/P.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/queen.svg',
                title: 'Q',
                backgroundColor: Color.fromARGB(115, 215, 118, 118),
                soundAsset: 'assets/sounds/queen.mp3',
                description: 'Queen',
                alternativeSoundAsset: 'assets/sounds/Q.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/rabbit.svg',
                title: 'R',
                soundAsset: 'assets/sounds/rabbit.mp3',
                description: 'Rabbit',
                backgroundColor: Color.fromARGB(174, 134, 218, 191),
                alternativeSoundAsset: 'assets/sounds/R.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/shiva.svg',
                title: 'S',
                backgroundColor: Color.fromARGB(170, 156, 216, 145),
                soundAsset: 'assets/sounds/shiva.mp3',
                description: 'Shiva',
                alternativeSoundAsset: 'assets/sounds/S.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/table.svg',
                title: 'T',
                backgroundColor: Color.fromARGB(180, 138, 64, 228),
                soundAsset: 'assets/sounds/table.mp3',
                description: 'Table',
                alternativeSoundAsset: 'assets/sounds/T.m4a',
              ),
              ItemTile(
                iconAsset: 'assets/images/umbrella.svg',
                title: 'U',
                backgroundColor: Color.fromARGB(189, 212, 127, 220),
                soundAsset: 'assets/sounds/umbrella.mp3',
                description: 'Umbrella',
                alternativeSoundAsset: 'assets/sounds/U.mp3',
              ),
              ItemTile(
                iconAsset: 'assets/images/van.svg',
                title: 'V',
                backgroundColor: Color.fromARGB(115, 215, 118, 118),
                soundAsset: 'assets/sounds/van.mp3',
                description: 'Van',
                alternativeSoundAsset: 'assets/sounds/V.mp3',
              ),
              ItemTile(
                iconAsset: 'assets/images/window.svg',
                title: 'W',
                backgroundColor: Color.fromARGB(255, 252, 187, 6),
                soundAsset: 'assets/sounds/window.mp3',
                description: 'Window',
                alternativeSoundAsset: 'assets/sounds/W.mp3',
              ),
              ItemTile(
                iconAsset: 'assets/images/xerox.svg',
                title: 'X',
                backgroundColor: Color.fromARGB(115, 0, 236, 71),
                soundAsset: 'assets/sounds/xerox.mp3',
                description: 'Xerox',
                alternativeSoundAsset: 'assets/sounds/X.mp3',
              ),
              ItemTile(
                iconAsset: 'assets/images/yellow.svg',
                title: 'Y',
                backgroundColor: Color.fromARGB(115, 9, 255, 230),
                soundAsset: 'assets/sounds/yellow.mp3',
                description: 'Yellow',
                alternativeSoundAsset: 'assets/sounds/Y.mp3',
              ),
              ItemTile(
                iconAsset: 'assets/images/zero.svg',
                title: 'Z',
                backgroundColor: Color.fromARGB(155, 81, 0, 255),
                soundAsset: 'assets/sounds/zero.mp3',
                description: 'Zero',
                alternativeSoundAsset: 'assets/sounds/Z.mp3',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
