import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PartsPage(),
    ),
  );
}

class PartsPage extends StatefulWidget {
  const PartsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PartsPage> createState() => _PartsPagePageState();
}

class _PartsPagePageState extends State<PartsPage> {
  final CardSwiperController controller = CardSwiperController();

  late List<PartsPageCard> cards;

  @override
  void initState() {
    super.initState();
    cards = generateCards();
  }

  List<PartsPageCard> generateCards() {
    return candidates.asMap().entries.map((entry) {
      final index = entry.key;
      final name = entry.value;
      final color = getCardColor(index);
      return PartsPageCard(name: name, color: color);
    }).toList();
  }
Color getCardColor(int index) {
    final int red =
        (index * 30) % 256; // Increment red component by 30 for each card
    final int green = ((index * 50) + 100) %
        256; // Increment green component by 50 for each card
    final int blue = ((index * 70) + 200) %
        256; // Increment blue component by 70 for each card
    // debugPrint(
    //   'The red = $red green = $green blue = $blue ',
    // );
    return Color.fromRGBO(red, green, blue, 1.0);
  }


  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: CardSwiper(
                controller: controller,
                cardsCount: cards.length,
                onSwipe: _onSwipe,
                onUndo: _onUndo,
                numberOfCardsDisplayed: 3,
                backCardOffset: const Offset(40, 40),
                padding: const EdgeInsets.all(24.0),
                cardBuilder: (
                  context,
                  index,
                  horizontalThresholdPercentage,
                  verticalThresholdPercentage,
                ) =>
                    cards[index],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    onPressed: controller.undo,
                    heroTag: "undo_button",
                    child: const Icon(Icons.rotate_left),
                  ),
                  FloatingActionButton(
                    onPressed: () => controller.swipe(CardSwiperDirection.left),
                    heroTag: "left_swipe_button",
                    child: const Icon(Icons.keyboard_arrow_left),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        controller.swipe(CardSwiperDirection.right),
                    heroTag: "right_swipe_button",
                    child: const Icon(Icons.keyboard_arrow_right),
                  ),
                  FloatingActionButton(
                    onPressed: () => controller.swipe(CardSwiperDirection.top),
                    heroTag: "up_swipe_button",
                    child: const Icon(Icons.keyboard_arrow_up),
                  ),
                  FloatingActionButton(
                    onPressed: () =>
                        controller.swipe(CardSwiperDirection.bottom),
                    heroTag: "down_swipe_button",
                    child: const Icon(Icons.keyboard_arrow_down),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool _onSwipe(
    int previousIndex,
    int? currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $previousIndex was swiped to the ${direction.name}. Now the card $currentIndex is on top',
    );
    return true;
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
    debugPrint(
      'The card $currentIndex was undod from the ${direction.name}',
    );
    return true;
  }
}

class PartsPageCard extends StatelessWidget {
  final String name;
  final double height;
  final Color color;

  const PartsPageCard({
    Key? key,
    required this.name,
    this.height = 300,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      child: Card(
        color: color,
        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/body/$name.svg",
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 10),
              Text(
                name,
                style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


final List<String> candidates = [
  "eye",
  "lips",
  "ankle",
  "arm",
  "back",
  "belly",
  "cheek",
  "chest",
  "chin",
  "ear",
  "elbow",
  "foot",
  "fingers",
  "hair",
  "hips",
  "knee",
  "leg",
  "nail",
  "neck",
  "nose",
  "palm",
  "shoulder",
  "stomach",
  "teeth",
  "thigh",
  "thumb",
  "toe",
  "tongue",
  "waist",
  "wrist",
];
