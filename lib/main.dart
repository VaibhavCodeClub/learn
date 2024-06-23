import 'package:flutter/material.dart';
import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:learn/landing_page.dart';
import 'package:learn/pages/main_home.dart';
import 'package:learn/utils/route/routes.dart';
import 'package:learn/theme_provider.dart';
// ignore: depend_on_referenced_packages
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

DateTime? currentBackPressTime;
bool visitedGettingStartedPageOnceBool=false; //to store the value of 

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final savedThemeMode = await AdaptiveTheme.getThemeMode();
  final prefs = await SharedPreferences.getInstance();
  visitedGettingStartedPageOnceBool = prefs.getBool('visitedGettingStartedPageOnce')??false; //if its is null i.e first time then set to false

  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: MyApp(savedThemeMode: savedThemeMode),
    ),
  );
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({Key? key, this.savedThemeMode}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Learn',
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          themeMode: themeProvider.themeMode,
          home: visitedGettingStartedPageOnceBool? const MainHome(): const LandingPage(), //if page opened for first time , show landing page (getting started page), else show home page
          onGenerateRoute: Routers.generateRoute,
        );
      },
    );
  }
}
