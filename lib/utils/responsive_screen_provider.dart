import 'package:flutter/material.dart';

class ResponsiveScreenProvider {
  static bool isMobileScreen(BuildContext context) {
    return MediaQuery.of(context).size.width < 480;
  }

  static bool isTabScreen(BuildContext context) {
    return MediaQuery.of(context).size.width > 480 &&
        MediaQuery.of(context).size.width < 800;
  }

  static bool isDesktopScreen(BuildContext context) {
    return MediaQuery.of(context).size.width >= 800;
  }
}
