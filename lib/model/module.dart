import 'package:flutter/material.dart';

class Module {
  final String name;
  final String description;
  final String thumbnailPath;
  final MaterialPageRoute route;
  final String? routeName;
  Color backgroundColor;

  Module({
    required this.name,
    required this.description,
    required this.thumbnailPath,
    required this.route,
    this.routeName,
    required this.backgroundColor,
  });
}
