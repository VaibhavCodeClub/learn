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
  int topCardIndex = 0;

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
    final int red = (index * 25) % 256;
    final int green = ((index * 50) + 100) % 256;
    final int blue = ((index * 70) + 200) % 256;

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
                onSwipe: (prevIndex, currentIndex, direction) {
                  setState(() {
                    topCardIndex = currentIndex ?? 0;
                  });
                  return true;
                },
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Top Card Information',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Name: ${cards[topCardIndex].name}',
                      style: const TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Description: ${getDescription(cards[topCardIndex].name)}',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
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

  String getDescription(String name) {
    switch (name) {
      case "Eye":
        return "The eye is an organ that reacts to light and allows vision.";
      case "Lips":
        return "The lips are a visible body part at the mouth of many animals, including humans.";
      case "Ankle":
        return "The ankle is the joint between the foot and the leg.";

      default:
        return "Description not available";
    }
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
                style:
                    const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final List<String> candidates = [
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
