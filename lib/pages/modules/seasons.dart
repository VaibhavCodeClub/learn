import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/utils/constants.dart';

class Season {
  final String name;
  final String description;
  final String imageAsset;
  final Color backgroundColor;

  Season({
    required this.name,
    required this.description,
    required this.imageAsset,
    required this.backgroundColor,
  });
}

class SeasonsPage extends StatelessWidget {
  SeasonsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Seasons Serenade',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: AppConstants.seasons.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              _showSeasonPopup(context, index);
            },
            child: Container(
              margin: const EdgeInsets.all(5.0),
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black, width: 1.0),
                borderRadius: BorderRadius.circular(8.0),
                color: AppConstants.seasons[index].backgroundColor,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                    height: 50,
                    child: SvgPicture.asset(
                        AppConstants.seasons[index].imageAsset),
                  ),
                  const SizedBox(width: 28.0),
                  Text(
                    AppConstants.seasons[index].name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      fontFamily: 'Comic',
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  void _showSeasonPopup(BuildContext context, int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return SeasonPopup(
          currentIndex: index,
          seasons: AppConstants.seasons,
        );
      },
    );
  }
}

class SeasonPopup extends StatefulWidget {
  final int currentIndex;
  final List<Season> seasons;

  SeasonPopup({
    required this.currentIndex,
    required this.seasons,
  });

  @override
  _SeasonPopupState createState() => _SeasonPopupState();
}

class _SeasonPopupState extends State<SeasonPopup> {
  late int currentIndex;

  @override
  void initState() {
    super.initState();
    currentIndex = widget.currentIndex;
  }

  @override
  Widget build(BuildContext context) {
    Season currentSeason = widget.seasons[currentIndex];

    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            currentSeason.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: 200,
            height: 200,
            child: SvgPicture.asset(currentSeason.imageAsset),
          ),
          const SizedBox(height: 16),
          Text(
            currentSeason.description,
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: _navigateToPreviousSeason,
              icon: const Icon(Icons.arrow_back),
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(color: Colors.white),
              ),
            ),
            IconButton(
              onPressed: _navigateToNextSeason,
              icon: const Icon(Icons.arrow_forward),
            ),
          ],
        ),
      ],
    );
  }

  void _navigateToPreviousSeason() {
    setState(() {
      currentIndex =
          (currentIndex - 1 + widget.seasons.length) % widget.seasons.length;
    });
  }

  void _navigateToNextSeason() {
    setState(() {
      currentIndex = (currentIndex + 1) % widget.seasons.length;
    });
  }
}
