

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:learn/cubit/index_cubit.dart';
import 'package:learn/main.dart';
import 'package:learn/pages/about.dart';
import 'package:learn/pages/explore/explore.dart';
import 'package:learn/pages/favorite.dart';
import 'package:learn/pages/home.dart';
import 'package:learn/widgets/navbar/navbar.dart';

class MainHome extends StatefulWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MainHome({
    super.key,
    this.savedThemeMode,
  });

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  bool _onBackPressed(bool canPop) {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: "Press back again to exit",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
      );
      canPop = false;
    } else {
      canPop = true;
    }
    return canPop;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      onPopInvoked: _onBackPressed,
      child: AdaptiveTheme(
        light: ThemeData.light(),
        dark: ThemeData.dark(),
        initial: widget.savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => BlocProvider(
          create: (context) => IndexCubit(),
          child: BlocBuilder<IndexCubit, int>(
            builder: (context, index) {
              return Scaffold(
                body: const [
                  MyHomePage(),
                  ExplorePage(),
                  FavoritePage(),
                  AboutPage(),
                ][index],
                bottomNavigationBar: const BottomNavBar(),
              );
            },
          ),
        ),
      ),
    );
  }
}
