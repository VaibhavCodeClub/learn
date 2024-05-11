import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn/utils/responsive_screen_provider.dart';

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
  late FlutterTts flutterTts;

  late List<PartsPageCard> cards;
  List<int> previousIndices = [];
  int topCardIndex = 0;

  @override
  void initState() {
    flutterTts = FlutterTts();

    super.initState();
    cards = generateCards();
  }

  List<PartsPageCard> generateCards() {
    return candidates.asMap().entries.map((entry) {
      final index = entry.key;
      final name = entry.value;
      var color = getCardColor(index);
      return PartsPageCard(name: name, color: color);
    }).toList();
  }

  Color getCardColor(int index) {
    int red = (index * 25) % 256;
    int green = ((index * 45) + 100) % 256;
    int blue = ((index * 70) + 200) % 256;

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
      appBar: AppBar(
        title: const Text(
          'Body Parts',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: ResponsiveScreenProvider.isMobileScreen(context)?CardSwiper(
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
        ) :
              Center(
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.4,
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
                          fontSize: 50, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 150,
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.volume_up,
                            // color: Colors.black,
                            size: 40,
                          ),
                          onPressed: () {
                            _speakText(cards[topCardIndex].name);
                          },
                        ),
                        const SizedBox(
                          width: 25,
                        ),
                        IconButton(
                          onPressed: controller.undo,
                          icon: const Icon(
                            Icons.rotate_left,
                            // color: Colors.black,
                            size: 40,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    const SizedBox(height: 5),
                    SizedBox(
                      height: 200,
                      child: SingleChildScrollView(
                        clipBehavior: Clip.hardEdge,
                        child: Text(
                          getDescription(cards[topCardIndex].name),
                          style: const TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _speakText(String text) async {
    await flutterTts.setLanguage("EN-IN");

    await flutterTts.speak(text);
  }

  bool _onUndo(
    int? previousIndex,
    int currentIndex,
    CardSwiperDirection direction,
  ) {
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
        return "Like window to see the world! They help you see colors, shapes, and all your friends.\nThe eye is an organ that reacts to light and allows vision.";
      case "Lips":
        return "Help you to talk and smile. They can taste sweet and sour things too.\nThe lips are a visible body part at the mouth.";
      case "Ankle":
        return "It helps you jump, hop, and run around!\nThe ankle is the joint between the foot and the leg.";
      case "Arm":
        return "Like long branches that help you hug, wave, and hold toys. They bend at the elbow like magic!\nArms help you lift and carry things.";
      case "Back":
        return "The big, strong wall at the back of your body. It helps you stand tall and straight, and holds everything inside safe.";
      case "Belly":
        return "Like a big balloon that holds your food until your body uses it for energy!\nYour belly helps you digest food.";
      case "Cheek":
        return "The soft, squishy parts on your face, perfect for smiling and cuddling with loved ones.\nCheeks help shape your face.";
      case "Chest":
        return "The front of your body, where your heart beats strong and keeps you going all day.\nYour chest helps you breathe.";
      case "Chin":
        return "The pointy bone below your lips, like a little shelf for your smile to rest on.\nYour chin is the bottom of your face.";
      case "Ear":
        return "Like two funnels on the sides of your head that help you hear music, voices, and laughter.";
      case "Elbow":
        return "The bendy joint in the middle of your arm, like a magic hinge that helps you reach and play.\nElbows help you bend your arms.";
      case "Foot":
        return "Like two strong platforms that help you walk, run, and jump! They have wiggly toes to grip the ground.";
      case "Fingers":
        return "Five little helpers at the end of your hands, perfect for grabbing, pointing, and tickling!\nFingers help you pick up and touch things.";
      case "Hair":
        return "Grows on your head and body like tiny grass, and can be straight, curly, or in between! You can style it in fun ways!";
      case "Hips":
        return "The bony part below your belly, that helps your legs move and hold your body up.";
      case "Knee":
        return "The bendy joint in the middle of your leg, that helps you walk, run, and kneel down.\nKnees help you bend your legs.";
      case "Leg":
        return "Two strong pillars that help you walk, run, jump, and dance! They bend at the knee and ankle.";
      case "Nail":
        return "The hard, white caps on your fingers and toes, like tiny shields that protect them.";
      case "Neck":
        return "Connects your head to your body and helps you move your head around to see and hear everything.";
      case "Nose":
        return "Sticks out from your face and helps you smell things and breathe.";
      case "Palm":
        return "The flat part of your hand, with lines that make your handprint unique! It helps you hold things.";
      case "Shoulder":
        return "Where your arm meets your body, like a special socket that helps you move your arm freely.\nShoulders help you lift and carry things.";
      case "Stomach":
        return "The part below your chest, where your food goes after you eat. It helps your body get the energy it needs.\nThe stomach helps digest food.";
      case "Teeth":
        return "Hard, white tools in your mouth that help you chew food and smile brightly!";
      case "Thigh":
        return "The thick part of your upper leg, like a strong pillar that helps you walk, run, and jump.";
      case "Thumb":
        return "The big, special finger on your hand, that helps you grip and hold things tightly and do cool pinches.";
      case "Toe":
        return "The five little wigglers on your foot, that help you balance and grip the ground when you walk and run.";
      case "Tongue":
        return "The fun, muscley friend in your mouth that helps you taste food, talk, and lick yummy treats!";
      case "Waist":
        return "The middle part of your body, between your chest and hips. It helps your body bend and move.";
      case "Wrist":
        return "The bendy joint between your hand and arm, like a hinge that helps you move your hand freely.";
      default:
        return "Sorry, we don't have information about that organ.";
    }
  }
}

class PartsPageCard extends StatelessWidget {
  final String name;
  final Color color;

  const PartsPageCard({
    Key? key,
    required this.name,
    required this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 158, 155, 155),
          width: 2.0,
        ),
      ),
      child: Card(
        color: color,
        child: SizedBox(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: SvgPicture.asset(
                  "assets/body/$name.svg",
                  width: 250,
                  height: 250,
                ),
              ),
              const SizedBox(height: 10),
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
