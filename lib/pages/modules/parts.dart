import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn/utils/assets_path.dart';
import 'package:learn/utils/constants.dart';
import 'package:learn/utils/functions.dart';
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
    return AppConstants.candidates.asMap().entries.map((entry) {
      final index = entry.key;
      final name = entry.value;
      var color = AppFunctions().getCardColor(index);
      return PartsPageCard(name: name, color: color);
    }).toList();
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
          AppConstants.parts,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: ResponsiveScreenProvider.isMobileScreen(context)
                  ? CardSwiper(
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
                    )
                  : Center(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        width: MediaQuery.of(context).size.height * 0.6,
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
            Expanded(
              child: Padding(
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
                            AppFunctions()
                                .getDescription(cards[topCardIndex].name),
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
                  AssetsPath.getBodyImage("$name.svg"),
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
