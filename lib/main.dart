import 'package:flutter/material.dart';
import 'package:flutter_hackathon_bread_donate/config/routes.dart';
import 'package:flutter_hackathon_bread_donate/screens/home/home_screen.dart';
import 'package:flutter_hackathon_bread_donate/screens/splash/splash_screen.dart';

import 'config/styles/styles.dart';

void main() {
  runApp(DonationApp());
}

class DonationApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: customTheme,
      initialRoute: HomeScreen.routeName,
      routes: routes,
    );
  }
}
