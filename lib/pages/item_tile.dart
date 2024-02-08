// ItemTile.dart

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:just_audio/just_audio.dart';
// ItemTile.dart

class ItemTile extends StatefulWidget {
  final String iconAsset;
  final String title;
  final String description;
  final String soundAsset;
  final String alternativeSoundAsset;
  final Color backgroundColor;

  const ItemTile({
    Key? key,
    required this.iconAsset,
    required this.title,
    required this.soundAsset,
    required this.description,
    required this.alternativeSoundAsset,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  ItemTileState createState() => ItemTileState();
}

class ItemTileState extends State<ItemTile> {
  final player = AudioPlayer();

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  Future<void> _playSound(String soundAsset) async {
    try {
      await player.setAsset(soundAsset);
      await player.play();
    } catch (e) {
      if (kDebugMode) {
        print('Error playing sound: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: widget.backgroundColor,
      child: InkWell(
        onTap: () {
          _playSound(widget.soundAsset);
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
                      _playSound(widget.alternativeSoundAsset);
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
  }Widget _buildPopupContent() {
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
                padding: const EdgeInsets.only(left: 5), // Add left padding of 5 pixels
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
                icon: const Icon(Icons.volume_up, color: Colors.black,size: 40,),
                onPressed: () {
                  _playSound(widget.alternativeSoundAsset);
                },
              ),
            ],
          ),
          const SizedBox(height: 20),
          GestureDetector(
            onTap: () {
              _playSound(widget.soundAsset); // Play sound when image is tapped
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