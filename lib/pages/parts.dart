import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(
    MaterialApp(
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
  List<int> previousIndices = [];
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
                    previousIndices.add(topCardIndex);
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
                    Text(
                      cards[topCardIndex].name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
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
      'The card $currentIndex was undone from the ${direction.name}',
    );

    if (previousIndices.isNotEmpty) {
      setState(() {
        topCardIndex = previousIndices.removeLast();
      });
    }

    return true;
  }

  String getDescription(String name) {
    switch (name) {
      case "Eye":
        return "The eye is an organ that reacts to light and allows vision.\nThe eye helps you see things.";
      case "Lips":
        return "The lips are a visible body part at the mouth.\nLips help you talk and eat.";
      case "Ankle":
        return "The ankle is the joint between the foot and the leg.\nAnkles help you walk and run.";
      case "Arm":
        return "Arms help you lift and carry things.\nThe arm is the part of the upper limb between the shoulder and the elbow joint.";
      case "Back":
        return "Your back helps you stand up straight and move.\nThe back is the posterior side of the human body, between the neck and the pelvis.";
      case "Belly":
        return "Your belly helps you digest food.\nThe belly is the region of the body between the chest and pelvis.";
      case "Cheek":
        return "Cheeks help shape your face and smile.\nThe cheek is the soft skin on each side of the face, below the eyes.";
      case "Chest":
        return "Your chest helps you breathe.\nThe chest is the area of the body between the neck and the abdomen, including the heart and lungs.";
      case "Chin":
        return "Your chin is the bottom of your face.\nThe chin is the protruding part of the lower jaw.";
      case "Ear":
        return "Ears help you hear sounds.\nThe ear is the organ of hearing and balance.";
      case "Elbow":
        return "Elbows help you bend your arms.\nThe elbow is the joint between the upper arm and the forearm.";
      case "Foot":
        return "Feet help you walk and run.\nThe foot is the terminal portion of the leg, below the ankle joint.";
      case "Fingers":
        return "Fingers help you pick up and touch things.\nFingers are the digits of the hand, typically excluding the thumb.";
      case "Hair":
        return "Hair grows on your head and body.\nHair is a protein filament that grows from follicles found in the dermis.";
      case "Hips":
        return "Hips help you move your legs and body.\nThe hips are the sides of the body below the waist.";
      case "Knee":
        return "Knees help you bend your legs.\nThe knee is the joint between the thigh and the lower leg in humans.";
      case "Leg":
        return "Legs help you walk and run.\nThe leg is the lower limb of the body.";
      case "Nail":
        return "Nails cover the ends of your fingers and toes.\nA nail is a horn-like envelope covering the tips of the fingers and toes in humans.";
      case "Neck":
        return "The neck connects your head to your body.\nThe neck is the part of the body that connects the head to the torso.";
      case "Nose":
        return "Noses help you smell things and breathe.\nThe nose is the organ responsible for the sense of smell and for breathing.";
      case "Palm":
        return "Palms are the inside part of your hands.\nThe palm is the central region of the front of the hand.";
      case "Shoulder":
        return "Shoulders help you lift and carry things.\nThe shoulder is the region of the body where the arm attaches to the torso.";
      case "Stomach":
        return "The stomach helps digest food.\nThe stomach is a muscular organ located on the left side of the upper abdomen.";
      case "Teeth":
        return "Teeth help you chew food.\nTeeth are hard, mineralized structures found in the mouths of many vertebrates.";
      case "Thigh":
        return "Thighs help you walk and run.\nThe thigh is the part of the lower limb between the hip and the knee.";
      case "Thumb":
        return "Thumbs help you grip and hold things.\nThe thumb is the first digit of the hand, set apart from the other four by its opposable nature.";
      case "Toe":
        return "Toes help you balance and walk.\nA toe is one of the five digits of the foot.";
      case "Tongue":
        return "The tongue helps you taste and talk.\nThe tongue is a muscular organ in the mouth responsible for tasting, swallowing, and speaking.";
      case "Waist":
        return "The waist is the middle part of your body.\nThe waist is the narrowing of the body between the ribs and the hips.";
      case "Wrist":
        return "Wrists help you move your hands.\nThe wrist is the joint connecting the hand to the forearm.";
           default:
        return "Sorry, we don't have information about that organ.";
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
