import 'package:flutter/material.dart';

class Planet {
  final String name;
  final String svgAsset;
  final String description;
  final Color backgroundColor;

  Planet({
    required this.name,
    required this.svgAsset,
    required this.description,
    required this.backgroundColor,
  });
}
