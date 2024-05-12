import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learn/utils/assets_path.dart';

class FlowerPage extends StatefulWidget {
  const FlowerPage({super.key});

  @override
  State<FlowerPage> createState() => _FlowerPageState();
}

class _FlowerPageState extends State<FlowerPage> {
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        color: Colors.red,
        child: SvgPicture.asset(AssetsPath.getFlowerImage('sunflower.svg')
            ),
      ));
  }
}
