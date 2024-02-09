import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_tts/flutter_tts.dart';

class ItemTile extends StatefulWidget {
  final String iconAsset;
  final String title;
  final String description;
  // final String alternativeSoundAsset;
  final Color backgroundColor;

  const ItemTile({
    Key? key,
    required this.iconAsset,
    required this.title,
    required this.description,
    // required this.alternativeSoundAsset,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  ItemTileState createState() => ItemTileState();
}

class ItemTileState extends State<ItemTile> {
  late FlutterTts flutterTts;

  @override
  void initState() {
    super.initState();
    flutterTts = FlutterTts();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _speakText(String text) async {
    await flutterTts.setLanguage("EN-IN");
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.backgroundColor,
      child: InkWell(
        onTap: () {
          // _speakText(widget.title);
          _speakText(widget.description);
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (BuildContext context) {
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).viewInsets.bottom,
                  ),
                  child: Container(
                    color: widget.backgroundColor,
                    child: _buildPopupContent(),
                  ),
                ),
              );
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(6),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 48),
                      child: Text(
                        widget.title,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.volume_up),
                    onPressed: () {
                      _speakText(widget.title);
                    },
                  ),
                ],
              ),
              const SizedBox(height: 3),
              SvgPicture.asset(
                widget.iconAsset,
                width: 100,
                height: 100,
                alignment: Alignment.center,
              ),
              const SizedBox(height: 3),
              Text(widget.description, textAlign: TextAlign.center),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPopupContent() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 0.7,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    widget.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      color: Colors.black,
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.volume_up,
                    color: Colors.black,
                    size: 40,
                  ),
                  onPressed: () {
                    _speakText(widget.title);
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            GestureDetector(
              onTap: () {
                // _speakText(widget.title);
                _speakText(widget.description);
              },
              child: SvgPicture.asset(
                widget.iconAsset,
                width: 200,
                height: 200,
                alignment: Alignment.center,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              widget.description,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 28,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Close'),
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
