import 'package:flutter/material.dart';

PageRouteBuilder slidePageRoute(Widget destinationScreen) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) {
      return destinationScreen; // Navigate to the provided destination screen
    },
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: Curves.easeOutQuad,
      );

      return FadeTransition(
        opacity: curvedAnimation,
        child: child,
      );
    },
  );
}
