// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/models/season_model.dart';
import 'package:learn/utils/constants.dart';
import '../../utils/const_dimensions.dart';

class SeasonsPage extends StatelessWidget {
  const SeasonsPage({Key? key}) : super(key: key);

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
                    width: ConstantDimensions.widthExtraLarge,
                    height: ConstantDimensions.heightExtraLarge,
                    child: SvgPicture.asset(
                        AppConstants.seasons[index].imageAsset),
                  ),
                  const SizedBox(width: ConstantDimensions.widthMedium_Large),
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

  const SeasonPopup({
    super.key,
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
            width: ConstantDimensions.widthExtraLarge * 4,
            height: ConstantDimensions.heightExtraLarge * 4,
            child: SvgPicture.asset(currentSeason.imageAsset),
          ),
          const SizedBox(height: ConstantDimensions.heightSmall_Medium),
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
