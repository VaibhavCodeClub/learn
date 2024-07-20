import 'package:flutter/material.dart';

class Fruit {
  final String name;
  final String svgAsset;
  final bool isfruit;
  final Color backgroundColor;

  Fruit({
    required this.name,
    required this.isfruit,
    required this.svgAsset,
    required this.backgroundColor,
  });
}
