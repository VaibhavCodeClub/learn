import 'package:flutter/material.dart';

class Animal {
  final String name;
  final String svgAsset;
  final String soundAsset;
  final Color backgroundColor;

  Animal({
    required this.name,
    required this.svgAsset,
    required this.soundAsset,
    required this.backgroundColor,
  });
}
