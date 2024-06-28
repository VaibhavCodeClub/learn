import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:learn/pages/fruits.dart';
import 'package:learn/utils/const_dimensions.dart';
import 'package:learn/models/itemdata_model.dart';
import 'package:learn/utils/constants.dart';

class ItemTile extends StatelessWidget {
  final int index;
  final List<ItemData> items;
  final bool isTimerEnabled;

  const ItemTile({
    Key? key,
    required this.index,
    required this.items,
    required this.isTimerEnabled,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = items[index];
    return Card(
      color: item.backgroundColor,
      child: InkWell(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return _PopupDialog(
                items: items,
                currentIndex: index,
                isAutoNextEnabled: isTimerEnabled,
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
              LayoutBuilder(
                  builder: (BuildContext context, BoxConstraints constraints) {
                if (MediaQuery.of(context).orientation ==
                    Orientation.portrait) {
                  return SvgPicture.asset(
                    item.iconAsset,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    alignment: Alignment.center,
                  );
                } else {
                  return SvgPicture.asset(
                    item.iconAsset,
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.2,
                    alignment: Alignment.center,
                  );
                }
              }),
              const SizedBox(height: ConstantDimensions.heightExtraSmall / 2),
              Text(item.description, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }
}

class _PopupDialog extends StatefulWidget {
  final List<ItemData> items;
  final int currentIndex;
  final bool isAutoNextEnabled;

  const _PopupDialog({
    Key? key,
    required this.items,
    required this.currentIndex,
    required this.isAutoNextEnabled,
  }) : super(key: key);

  @override
  _PopupDialogState createState() => _PopupDialogState();
}

class _PopupDialogState extends State<_PopupDialog> {
  late FlutterTts flutterTts;
  late int currentIndex;
  late Timer? timer;
  late bool isAutoNextEnabled;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
    currentIndex = widget.currentIndex;
    isAutoNextEnabled = widget.isAutoNextEnabled;

    _speakDescription();
    if (isAutoNextEnabled) {
      timer = Timer.periodic(const Duration(seconds: 3), (Timer t) {
        _nextItem();
      });
    }
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  Future<void> _speakDescription() async {
    final currentItem = widget.items[currentIndex];
    await flutterTts.setLanguage("EN-IN");
    await flutterTts.speak(currentItem.title);
    await flutterTts.speak(currentItem.description);
  }

  Future<void> _speakText(String text) async {
    await flutterTts.speak(text);
  }

  void _previousItem() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        _speakDescription();
      }
    });
  }

  void _nextItem() {
    setState(() {
      if (currentIndex < widget.items.length - 1) {
        currentIndex++;
        _speakDescription();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentItem = widget.items[currentIndex];
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      content: Container(
        padding: EdgeInsets.zero,
        width: MediaQuery.of(context).size.width * 0.75,
        height: MediaQuery.of(context).size.height * 0.75,
        decoration: BoxDecoration(
            color: currentItem.backgroundColor,
            borderRadius: BorderRadius.circular(15)),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    currentItem.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: ConstantDimensions.heightMedium),
                  GestureDetector(
                    onTap: () {
                      _speakText(currentItem.description);
                    },
                    child: SvgPicture.asset(
                      currentItem.iconAsset,
                      width: MediaQuery.of(context).size.width * 0.5,
                      height: MediaQuery.of(context).size.height * 0.3,
                      alignment: Alignment.center,
                    ),
                  ),
                  const SizedBox(height: ConstantDimensions.heightMedium),
                  Text(
                    currentItem.description,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 28,
                    ),
                  ),
                  const SizedBox(height: ConstantDimensions.heightMedium),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: _previousItem,
                        child: const Text('Prev'),
                      ),
                      ElevatedButton(
                        onPressed: _nextItem,
                        child: const Text('Next'),
                      ),
                    ],
                  
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AtoZ extends StatefulWidget {
  const AtoZ({Key? key}) : super(key: key);

  @override
  State<AtoZ> createState() => _AtoZState();
}

class _AtoZState extends State<AtoZ> {
  bool isTimerEnabled = false;

  List<ItemData> items = AppConstants.alphabetItems;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              'A-Z',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: isTimerEnabled
                        ? MaterialStateProperty.all(Colors.green)
                        : MaterialStateProperty.all(Colors.red ),
                  ),
                  onPressed: () {
                    setState(() {
                      isTimerEnabled = !isTimerEnabled;
                    });
                  },
                  child: const Text(
                    'Auto',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(9),
        child: GridView.count(
          crossAxisCount: MediaQuery.of(context).size.width ~/
              200, // Adjust the value based on screen width
          childAspectRatio: 0.8, // Aspect ratio of items
          children: List.generate(
            items.length,
            (index) => ItemTile(
              index: index,
              items: items,
              isTimerEnabled: isTimerEnabled,
            ),
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(const AtoZ());
}
