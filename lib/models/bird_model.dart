import 'package:flutter/material.dart';

class Bird {
  final String name;
  final String svgAsset;
  final String soundAsset;
  final Color backgroundColor;

  Bird({
    required this.name,
    required this.svgAsset,
    required this.soundAsset,
    required this.backgroundColor,
  });
}
